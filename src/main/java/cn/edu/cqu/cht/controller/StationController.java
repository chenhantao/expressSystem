package cn.edu.cqu.cht.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.cqu.cht.function.MD5;
import cn.edu.cqu.cht.model.Base;
import cn.edu.cqu.cht.model.Courier;
import cn.edu.cqu.cht.model.Orderlist;
import cn.edu.cqu.cht.model.Station;
import cn.edu.cqu.cht.model.StationOrder;
import cn.edu.cqu.cht.service.BaseService;
import cn.edu.cqu.cht.service.CourierService;
import cn.edu.cqu.cht.service.OrderlistService;
import cn.edu.cqu.cht.service.StationOrderService;
import cn.edu.cqu.cht.service.StationService;

/**
 * @author CHT
 * @date 创建时间：2018年5月24日 上午2:29:39
 * @version 1.0
 */
@Controller
@RequestMapping("/station")
public class StationController {
	@Autowired
	private BaseService baseService;
	@Autowired
	private StationService stationService;
	@Autowired
	private CourierService courierService;
	@Autowired
	private OrderlistService orderlistService;
	@Autowired
	private StationOrderService stationOrderService;
	
	@RequestMapping("/changestation")
	public String changeStation(HttpServletRequest request) {
		Station station=(Station)request.getSession().getAttribute("loginstation");
		station.setPhone(request.getParameter("change_phone"));
		station.setAddress(request.getParameter("change_station_addr"));
		if(stationService.updateStation(station)) {
			return "station/changesuccess";
		}else {
			return "base/error";
		}
	}
	
	@RequestMapping("/changestationpassword")
	public String changeStationPassword(HttpServletRequest request) {
		Station station = (Station) request.getSession().getAttribute("loginstation");
		Base base = baseService.findById(station.getStationId());
		base.setPassword(MD5.getInstance().getMD5(request.getParameter("change_new_password")));
		if (baseService.updatePassword(base)) {
			return "station/changesuccess";
		} else {
			return "base/error";
		}
	}
	
	@RequestMapping("/employeecouriers")
	public String employeeCouriers(HttpServletRequest request,@RequestParam(required=true,defaultValue="1")Integer page,Model model,@RequestParam(required=true,defaultValue="6")Integer limit) {
		Station station=(Station)request.getSession().getAttribute("loginstation");
		PageHelper.startPage(page, limit);
		List<Courier> list=courierService.findCouriers(station.getProvince(), station.getCity(), station.getArea());
		PageInfo<Courier> p=new PageInfo<Courier>(list);
		model.addAttribute("page", p);
		model.addAttribute("userlist", list);
		model.addAttribute("limit",limit);
		return "station/employeecouriers";
	}
	
	@RequestMapping("/welcomestation")
	public String welcomeStation() {
		return "station/welcomestation";
	}
	
	@RequestMapping("/stationMenu")
	public String stationMenu() {
		return "station/stationmenu";
	}
	
	@RequestMapping("/showPage")
	public String showPage() {
		return "station/showpage";
	}
	
	@RequestMapping("/stationinfo")
	public String stationInfo() {
		return "station/stationinfo";
	}
	@RequestMapping("/stationpassword")
	public String stationPassword() {
		return "station/stationpassword";
	}
	@RequestMapping("/findactiveorders")
	public String findActiveOrders(HttpServletRequest request,@RequestParam(required=true,defaultValue="1")Integer page,Model model,@RequestParam(required=true,defaultValue="6")Integer limit) {
		Station station=(Station)request.getSession().getAttribute("loginstation");
		List<Orderlist> list=orderlistService.findActiveOrders(station.getProvince(), station.getCity(), station.getArea(), page, limit);
		PageInfo<Orderlist> p=new PageInfo<Orderlist>(list);
		model.addAttribute("page", p);
		model.addAttribute("userlist", list);
		model.addAttribute("limit",limit);
		return "station/findactiveorders";
	}
	@RequestMapping("/receiveorders")
	public String reveiveOrders(HttpServletRequest request,String orderId) {
		Station station=(Station)request.getSession().getAttribute("loginstation");
		Orderlist orderlist=orderlistService.findByOrderId(orderId);
		orderlist.setTransportState((short) 1);
		orderlist.setCurrentProvince(station.getProvince());
		orderlist.setCurrentCity(station.getCity());
		orderlist.setCurrentArea(station.getArea());
		orderlist.setCurrentStation(station.getStationName());
		orderlist.setNextProvince("");
		orderlist.setNextCity("");
		orderlist.setNextArea("");
		
		StationOrder stationOrder=new StationOrder();
		stationOrder.setStationId(station.getStationId());
		stationOrder.setOrderId(orderId);
		stationOrder.setSalary(0.00);
		stationOrder.setOrderState(orderlist.getOrderState());
		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		stationOrder.setTime(f.format(new Date()));
		if(stationOrderService.insertStationOrder(stationOrder)&&orderlistService.updateOrder(orderlist)){
			return "station/ordersuccess";
		}else {
			return "base/error";
		}		
	}
	@RequestMapping("/stationorders")
	public String stationOrders(HttpServletRequest request,@RequestParam(required=true,defaultValue="1")Integer page,Model model,@RequestParam(required=true,defaultValue="6")Integer limit) {
		Station station=(Station)request.getSession().getAttribute("loginstation");
		PageHelper.startPage(page, limit);
		List<Orderlist> list=stationService.findMyOrders(station.getStationId());
		PageInfo<Orderlist> p=new PageInfo<Orderlist>(list);
		model.addAttribute("page", p);
		model.addAttribute("userlist", list);
		model.addAttribute("limit",limit);
		return "station/stationorders";
	}
	@RequestMapping("/checkmoney")
	public String checkMoney(HttpServletRequest request,@RequestParam(required=true,defaultValue="1")Integer page,Model model,@RequestParam(required=true,defaultValue="6")Integer limit) {
		Station station=(Station)request.getSession().getAttribute("loginstation");
		List<StationOrder> list=stationOrderService.findByStationId(station.getStationId(), page, limit);
		Double total=0.00;
		for(StationOrder s:list) {
			total+=s.getSalary();
		}
		PageInfo<StationOrder> p=new PageInfo<StationOrder>(list);
		model.addAttribute("page", p);
		model.addAttribute("userlist", list);
		model.addAttribute("limit",limit);
		model.addAttribute("total",total);
		return "station/checkmoney";
	}
	@RequestMapping("/employee")
	public String employee(HttpServletRequest request,Integer courierId) {
		Station station=(Station)request.getSession().getAttribute("loginstation");
		Courier courier=courierService.findByCourierId(courierId);
		courier.setStationId(station.getStationId());
		if(courierService.updateCourier(courier)) {
			return "station/employeesuccess";
		}else {
			return "base/error";
		}
	}
	@RequestMapping("/stationcouriers")
	public String stationCouriers(HttpServletRequest request,@RequestParam(required=true,defaultValue="1")Integer page,Model model,@RequestParam(required=true,defaultValue="6")Integer limit){
		Station station=(Station)request.getSession().getAttribute("loginstation");
		PageHelper.startPage(page, limit);
		List<Courier> list=courierService.findByStationId(station.getStationId());
		PageInfo<Courier> p=new PageInfo<Courier>(list);
		model.addAttribute("page", p);
		model.addAttribute("userlist", list);
		model.addAttribute("limit",limit);
		return "station/stationcouriers";
	}
	@RequestMapping("/fire")
	public String fire(HttpServletRequest request,Integer courierId) {
		Courier courier=courierService.findByCourierId(courierId);
		courier.setStationId(0);
		if(courierService.updateCourier(courier)) {
			return "station/employeesuccess";
		}else {
			return "base/error";
		}
	}
	
	@RequestMapping("/stationquit")
	public String stationQuit(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.invalidate();
		return "base/base";
	}
}
