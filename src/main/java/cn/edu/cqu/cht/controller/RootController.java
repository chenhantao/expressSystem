package cn.edu.cqu.cht.controller;

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

import cn.edu.cqu.cht.model.Courier;
import cn.edu.cqu.cht.model.Orderlist;
import cn.edu.cqu.cht.model.Station;
import cn.edu.cqu.cht.model.User;
import cn.edu.cqu.cht.service.CourierService;
import cn.edu.cqu.cht.service.OrderlistService;
import cn.edu.cqu.cht.service.StationService;
import cn.edu.cqu.cht.service.UserService;

/**
 * @author CHT
 * @date 创建时间：2018年5月27日 下午2:38:43
 * @version 1.0
 */
@Controller
@RequestMapping("/root")
public class RootController {
	@Autowired
	private UserService userService;
	@Autowired
	private StationService stationService;
	@Autowired
	private CourierService courierService;
	@Autowired
	private OrderlistService orderlistService;

	@RequestMapping("/rootmenu")
	public String rootMenu() {
		return "root/rootmenu";
	}

	@RequestMapping("/showPage")
	public String showPage() {
		return "root/showpage";
	}

	@RequestMapping("/findallorders")
	public String findAllOrders(HttpServletRequest request,
			@RequestParam(required = true, defaultValue = "1") Integer page, Model model,
			@RequestParam(required = true, defaultValue = "6") Integer limit) {
		List<Orderlist> list = orderlistService.findAllOrders(page, limit);
		PageInfo<Orderlist> p = new PageInfo<>(list);
		model.addAttribute("page", p);
		model.addAttribute("userlist", list);
		model.addAttribute("limit", limit);
		return "root/findallorders";
	}

	@RequestMapping("/findallusers")
	public String findAllUsers(HttpServletRequest request,
			@RequestParam(required = true, defaultValue = "1") Integer page, Model model,
			@RequestParam(required = true, defaultValue = "6") Integer limit) {
		List<User> list=userService.findAllUsers(page, limit);
		PageInfo<User> p=new PageInfo<>(list);
		model.addAttribute("page", p);
		model.addAttribute("userlist", list);
		model.addAttribute("limit", limit);
		return "root/findallusers";
	}
	
	@RequestMapping("/checkstation")
	public String checkStation(HttpServletRequest request,
			@RequestParam(required = true, defaultValue = "1") Integer page, Model model,
			@RequestParam(required = true, defaultValue = "6") Integer limit) {
		List<Station> list=stationService.findAllUnpassStations(page, limit);
		PageInfo<Station> p=new PageInfo<>(list);
		model.addAttribute("page", p);
		model.addAttribute("userlist", list);
		model.addAttribute("limit", limit);
		return "root/checkstation";
	}
	@RequestMapping("/passstation")
	public String passStation(HttpServletRequest request,Integer stationId) {
		if(stationService.passStation(stationId)) {
			return "root/passsuccess";
		}else {
			return "base/error";
		}
	}
	
	@RequestMapping("/findallstations")
	public String findAllStations(HttpServletRequest request,
			@RequestParam(required = true, defaultValue = "1") Integer page, Model model,
			@RequestParam(required = true, defaultValue = "6") Integer limit) {
		List<Station> list=stationService.findAllStations(page, limit);
		PageInfo<Station> p=new PageInfo<>(list);
		model.addAttribute("page", p);
		model.addAttribute("userlist", list);
		model.addAttribute("limit", limit);
		return "root/findallstations";
	}
	@RequestMapping("/checkstationorders")
	public String checkStationOrders(HttpServletRequest request,
			@RequestParam(required = true, defaultValue = "1") Integer page, Model model,
			@RequestParam(required = true, defaultValue = "6") Integer limit,Integer stationId) {
		PageHelper.startPage(page, limit);
		List<Orderlist> list=stationService.findMyOrders(stationId);
		PageInfo<Orderlist> p=new PageInfo<>(list);
		model.addAttribute("page", p);
		model.addAttribute("userlist", list);
		model.addAttribute("limit", limit);
		model.addAttribute("stationId", stationId);
		return "root/checkstationorders";
	}
	
	@RequestMapping("/findallcouriers")
	public String findAllCouriers(HttpServletRequest request,
			@RequestParam(required = true, defaultValue = "1") Integer page, Model model,
			@RequestParam(required = true, defaultValue = "6") Integer limit) {
		List<Courier> list=courierService.findAllCourier(page, limit);
		PageInfo<Courier> p=new PageInfo<>(list);
		model.addAttribute("page", p);
		model.addAttribute("userlist", list);
		model.addAttribute("limit", limit);
		return "root/findallcouriers";
	}
	@RequestMapping("/checkstationinfo")
	public String checkStationInfo(HttpServletRequest request,Model model,Integer stationId) {
		Station station=stationService.findByStationId(stationId);
		model.addAttribute("station", station);
		return "root/checkstationinfo";
	}
	
	@RequestMapping("quit")
	public String quit(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.invalidate();
		return "base/base";
		
	}
}
