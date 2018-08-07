package cn.edu.cqu.cht.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.cqu.cht.function.MD5;
import cn.edu.cqu.cht.model.Base;
import cn.edu.cqu.cht.model.Courier;
import cn.edu.cqu.cht.model.Station;
import cn.edu.cqu.cht.model.User;
import cn.edu.cqu.cht.service.BaseService;
import cn.edu.cqu.cht.service.CourierService;
import cn.edu.cqu.cht.service.StationService;
import cn.edu.cqu.cht.service.UserService;

/**
 * @author CHT
 * @date 创建时间：2018年5月17日 下午10:00:22
 * @version 1.0
 */
@Controller
@RequestMapping("/register")
public class RegisterController {
	@Autowired
	private BaseService baseService;
	@Autowired
	private UserService userService;
	@Autowired
	private StationService stationService;
	@Autowired
	private CourierService courierService;

	@RequestMapping("/registeruser")
	public String registerUser() {
		return "user/register";
	}

	@RequestMapping("/registerstation")
	public String registerStation() {
		return "station/register";
	}

	@RequestMapping("/registercourier")
	public String registerCourier() {
		return "courier/register";
	}

	@RequestMapping("/userregister")
	public String uerRegister(HttpServletRequest request) {
		// 先增加登录账户信息
		Base base = new Base();
		base.setAccount("u" + request.getParameter("register_account"));
		base.setPassword(MD5.getInstance().getMD5(request.getParameter("register_password")));
		if (baseService.findByAccount("u" + request.getParameter("register_account")) == null) {
			request.getSession().setAttribute("checkrepeat", false);
			baseService.addNewBase(base);
		} else {
			request.getSession().setAttribute("checkrepeat", true);
			return "user/register";
		}
		if (userService.addUser(base.getId(), request.getParameter("register_user_name"),
				request.getParameter("register_real_name"), request.getParameter("register_phone"),
				request.getParameter("register_email"), request.getParameter("register_addr"))) {
			User user = userService.findUserByUserId(base.getId());
			request.getSession().setAttribute("loginuser", user);
			return "user/user";
		} else {
			return "base/error";
		}
	}

	@RequestMapping("/stationregister")
	public String stationRegister(HttpServletRequest request) {
		Base base = new Base();
		base.setAccount("s" + request.getParameter("register_account"));
		base.setPassword(MD5.getInstance().getMD5(request.getParameter("register_password")));
		if (baseService.findByAccount("s" + request.getParameter("register_account")) == null) {
			request.getSession().setAttribute("checkrepeat", false);
			baseService.addNewBase(base);
		} else {
			request.getSession().setAttribute("checkrepeat", true);
			return "station/register";
		}
		// 分割地区
		String[] strings1 = new String[3];
		int num1 = 0;
		String sAddr = request.getParameter("addr-show");
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
		if (stationService.addStation(base.getId(), request.getParameter("register_station_name"), strings1[0],
				strings1[1], strings1[2], request.getParameter("register_addr"),
				request.getParameter("register_real_name"), request.getParameter("register_phone"))) {
			Station station = stationService.findByStationId(base.getId());
			request.getSession().setAttribute("loginstation", station);
			if(station.getStationState()==1) {
				return "station/station";
			}else {
				return "station/stationerror";
			}
		} else {
			return "base/error";
		}
	}

	@RequestMapping("/courierregister")
	public String courierRegister(HttpServletRequest request) {
		Base base = new Base();
		base.setAccount("c" + request.getParameter("register_account"));
		base.setPassword(MD5.getInstance().getMD5(request.getParameter("register_password")));
		if (baseService.findByAccount("c" + request.getParameter("register_account")) == null) {
			request.getSession().setAttribute("checkrepeat", false);
			baseService.addNewBase(base);
		} else {
			request.getSession().setAttribute("checkrepeat", true);
			return "courier/register";
		}
		// 分割地区
		String[] strings1 = new String[3];
		int num1 = 0;
		String sAddr = request.getParameter("addr-show");
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
		if (courierService.addCourier(base.getId(), request.getParameter("register_real_name"),
				request.getParameter("register_phone"), strings1[0], strings1[1], strings1[2])) {
			Courier courier = courierService.findByCourierId(base.getId());
			request.getSession().setAttribute("logincourier", courier);
			return "courier/courier";
		} else {
			return "base/error";
		}
	}

}
