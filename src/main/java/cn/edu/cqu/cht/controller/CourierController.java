package cn.edu.cqu.cht.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import cn.edu.cqu.cht.function.Test;
import cn.edu.cqu.cht.model.Base;
import cn.edu.cqu.cht.model.Courier;
import cn.edu.cqu.cht.model.CourierOrder;
import cn.edu.cqu.cht.model.Orderlist;
import cn.edu.cqu.cht.model.Station;
import cn.edu.cqu.cht.service.BaseService;
import cn.edu.cqu.cht.service.CourierOrderService;
import cn.edu.cqu.cht.service.CourierService;
import cn.edu.cqu.cht.service.OrderlistService;
import cn.edu.cqu.cht.service.StationOrderService;
import cn.edu.cqu.cht.service.StationService;

/**
 * @author CHT
 * @date 创建时间：2018年5月24日 上午2:29:52
 * @version 1.0
 */
@Controller
@RequestMapping("/courier")
public class CourierController {
	@Autowired
	private CourierService courierService;
	@Autowired
	private BaseService baseService;
	@Autowired
	private StationService stationService;
	@Autowired
	private OrderlistService orderlistService;
	@Autowired
	private CourierOrderService courierOrderService;
	@Autowired
	private StationOrderService stationOrderService;

	@RequestMapping("/changecourier")
	public String changeCourier(HttpServletRequest request) {
		Courier courier = (Courier) request.getSession().getAttribute("logincourier");
		courier.setCourierPhone(request.getParameter("change_phone"));
		String[] strings1 = new String[3];
		int num1 = 0;
		String sAddr = request.getParameter("addr-show");
		if (!sAddr.equals("")) {
			String temp = "";
			for (int i = 0; i < sAddr.length(); i++) {
				if (sAddr.charAt(i) != '-') {
					temp += String.valueOf(sAddr.charAt(i));
				} else {
					strings1[num1] = temp;
					num1++;
					temp = "";
				}
			}
			courier.setProvince(strings1[0]);
			courier.setCity(strings1[1]);
			courier.setArea(strings1[2]);
		}
		if (courierService.updateCourier(courier)) {
			return "courier/changesuccess";
		} else {
			return "base/error";
		}
	}

	@RequestMapping("/findorder")
	public String findOrder(HttpServletRequest request, @RequestParam(required = true, defaultValue = "1") Integer page,
			Model model, @RequestParam(required = true, defaultValue = "6") Integer limit) {
		Courier courier = (Courier) request.getSession().getAttribute("logincourier");
		if (courier.getStationId() != 0) {
			PageHelper.startPage(page, limit);
			List<Orderlist> list = courierService.findOrders(courier.getStationId(),stationService.findByStationId(courier.getStationId()).getStationName());
			PageInfo<Orderlist> p = new PageInfo<Orderlist>(list);
			model.addAttribute("page", p);
			model.addAttribute("userlist", list);
			model.addAttribute("limit", limit);
			return "courier/findorder";
		}else {
			model.addAttribute("station", courier.getStationId());
			return "courier/findorder";
		}
	}

	@RequestMapping("/receiveorder")
	public String receiveOrder(HttpServletRequest request, String orderId) {
		Courier courier = (Courier) request.getSession().getAttribute("logincourier");
		Orderlist orderlist = orderlistService.findByOrderId(orderId);
		orderlist.setCurrentCourier(courier.getCourierName());

		CourierOrder courierOrder = new CourierOrder();
		courierOrder.setCourierId(courier.getCourierId());
		courierOrder.setOrderId(orderId);
		courierOrder.setSalary(0.00);
		courierOrder.setOrderState(orderlist.getOrderState());
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		courierOrder.setTime(f.format(new Date()));
		if (courierOrderService.addCourierOrder(courierOrder) && orderlistService.updateOrder(orderlist)) {
			return "courier/ordersuccess";
		} else {
			return "base/error";
		}
	}

	@RequestMapping("/changecourierpassword")
	public String changeCourierPassword(HttpServletRequest request) {
		Courier courier = (Courier) request.getSession().getAttribute("logincourier");
		Base base = baseService.findById(courier.getCourierId());
		base.setPassword(MD5.getInstance().getMD5(request.getParameter("change_new_password")));
		if (baseService.updatePassword(base)) {
			return "courier/changesuccess";
		} else {
			return "base/error";
		}
	}

	@RequestMapping("/mystation")
	public String myStation(HttpServletRequest request, Model model) {
		Courier courier = (Courier) request.getSession().getAttribute("logincourier");
		if (courier.getStationId() == 0) {
			return "courier/nostation";
		} else {
			Station station = stationService.findByStationId(courier.getStationId());
			model.addAttribute("station", station);
			return "courier/mystation";
		}
	}

	@RequestMapping("/checkorder")
	public String checkOrder(HttpServletRequest request,
			@RequestParam(required = true, defaultValue = "1") Integer page, Model model,
			@RequestParam(required = true, defaultValue = "6") Integer limit) {
		Courier courier = (Courier) request.getSession().getAttribute("logincourier");
		if (courier.getStationId() != 0) {
			String stationName = stationService.findByStationId(courier.getStationId()).getStationName();

			PageHelper.startPage(page, limit);
			List<Orderlist> list = courierService.findMyOrders(courier.getCourierId());
			PageInfo<Orderlist> p = new PageInfo<Orderlist>(list);
			model.addAttribute("page", p);
			model.addAttribute("userlist", list);
			model.addAttribute("limit", limit);
			model.addAttribute("stationName", stationName);
			return "courier/checkorder";
		} else {
			model.addAttribute("station", courier.getStationId());
			return "courier/checkorder";
		}
	}

	@RequestMapping("/checklogistics")
	public String ckeckLogistics(HttpServletRequest request, Model model, String orderId) {
		Orderlist orderlist = orderlistService.findByOrderId(orderId);
		String logistics = orderlist.getLogisticsState();
		List<String> list = new ArrayList<String>();
		if (logistics != null && !logistics.equals("")) {
			list = Test.getInstance().showLogistics(logistics);
			model.addAttribute("logistics", list);
			model.addAttribute("orderId", orderId);
			return "courier/updatelogistics";
		} else {
			list.add("对不起，暂无物流状态");
			model.addAttribute("logistics", list);
			model.addAttribute("orderId", orderId);
			return "courier/updatelogistics";
		}
	}

	@RequestMapping("/updatelogistics")
	public String updateLogistics(HttpServletRequest request, String orderId) {
		Orderlist orderlist = orderlistService.findByOrderId(orderId);
		String newlogistics = request.getParameter("update_logistics");
		String[] strings1 = new String[3];
		int num1 = 0;
		String sAddr = request.getParameter("addr-show");
		if (!sAddr.equals("")) {
			String temp = "";
			for (int i = 0; i < sAddr.length(); i++) {
				if (sAddr.charAt(i) != '-') {
					temp += String.valueOf(sAddr.charAt(i));
				} else {
					strings1[num1] = temp;
					num1++;
					temp = "";
				}
			}
			if (newlogistics != null && !newlogistics.equals("")) {
				if (orderlist.getLogisticsState() != null) {
					orderlist.setLogisticsState(orderlist.getLogisticsState() + newlogistics + "-");
				} else {
					orderlist.setLogisticsState(newlogistics + "-");
				}
			}
			orderlist.setNextProvince(strings1[0]);
			orderlist.setNextCity(strings1[1]);
			orderlist.setNextArea(strings1[2]);
			orderlist.setCurrentStation("");
			orderlist.setCurrentCourier("");
			if (orderlistService.updateOrder(orderlist)) {
				return "courier/updatesuccess";
			} else {
				return "base/error";
			}
		} else {
			if (newlogistics != null && !newlogistics.equals("")) {
				if (orderlist.getLogisticsState() != null) {
					orderlist.setLogisticsState(orderlist.getLogisticsState() + newlogistics + "-");
				} else {
					orderlist.setLogisticsState(newlogistics + "-");
				}
			}
			if (orderlistService.updateOrder(orderlist)) {
				return "courier/updatesuccess";
			} else {
				return "base/error";
			}
		}
	}

	@RequestMapping("/confirmreceipt")
	public String confirmReceipt(HttpServletRequest request, String orderId) {
		// Courier courier=(Courier)request.getSession().getAttribute("logincourier");
		// 订单需要做的更新
		Orderlist orderlist = orderlistService.findByOrderId(orderId);
		orderlist.setLogisticsState(orderlist.getLogisticsState() + "订单已完成-");
		orderlist.setOrderState((short) 1);
		// 获取订单的总金额，方便后面计算提成
		double money = orderlist.getMoney();
		// 对于快递站订单关系表中的状态全部更新为1，结算报酬&&快递员订单关系表中的状态更新为1，结算报酬
		int num = stationOrderService.findAllByOrderNums(orderId);

		if (stationOrderService.updateStationOrder(orderId, money / 2 / num)
				&& courierOrderService.updateCourierOrder(orderId, money / 2 / num)
				&& orderlistService.updateOrder(orderlist)) {
			return "courier/ordersuccess";
		} else {
			return "base/error";
		}
	}

	@RequestMapping("/checkmoney")
	public String checkMoney(HttpServletRequest request,
			@RequestParam(required = true, defaultValue = "1") Integer page, Model model,
			@RequestParam(required = true, defaultValue = "6") Integer limit) {
		Courier courier = (Courier) request.getSession().getAttribute("logincourier");
		List<CourierOrder> list = courierOrderService.findCourierOrderByCourierId(courier.getCourierId(), page, limit);
		Double total = 0.00;
		for (CourierOrder s : list) {
			total += s.getSalary();
		}
		PageInfo<CourierOrder> p = new PageInfo<CourierOrder>(list);
		model.addAttribute("page", p);
		model.addAttribute("userlist", list);
		model.addAttribute("limit", limit);
		model.addAttribute("total", total);
		return "station/checkmoney";
	}

	@RequestMapping("/courierinfo")
	public String courierInfo(HttpServletRequest request) {
		return "courier/courierinfo";
	}

	@RequestMapping("/courierquit")
	public String courierQuit(HttpServletRequest re) {
		HttpSession session = re.getSession();
		session.invalidate();
		return "base/base";
	}

	@RequestMapping("/courierpassword")
	public String courierPassword() {
		return "courier/courierpassword";
	}

	@RequestMapping("/welcomecourier")
	public String welcomecourier() {
		return "courier/welcomecourier";
	}

	@RequestMapping("/couriermenu")
	public String courierMenu() {
		return "courier/couriermenu";
	}

	@RequestMapping("/showpage")
	public String shouPage() {
		return "courier/showpage";
	}
}
