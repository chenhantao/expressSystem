package cn.edu.cqu.cht.controller;
/**
 * @author CHT
 * @date 创建时间：2018年5月13日 下午11:20:50
 * @version 1.0
 */


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.cqu.cht.service.BaseService;
import cn.edu.cqu.cht.service.CourierService;
import cn.edu.cqu.cht.service.StationService;
import cn.edu.cqu.cht.service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private BaseService baseService;
	@Autowired
	private UserService userService;
	@Autowired
	private CourierService courierService;
	@Autowired
	private StationService stationService;
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String check(HttpServletRequest request) {
		if (baseService.checkLogin(request.getParameter("account"), request.getParameter("password"), request.getParameter("type"))) {
			if(request.getParameter("account").equals("root")) {
				return "root/root";
			}else if(request.getParameter("type").equals("u")) {
				String account="u"+request.getParameter("account");
				request.getSession().setAttribute("loginuser", userService.findUserByUserId(baseService.findByAccount(account).getId()));
				return "user/user";
			}else if (request.getParameter("type").equals("s")) {
				String account="s"+request.getParameter("account");
				if(stationService.findByStationId(baseService.findByAccount(account).getId()).getStationState()==1) {
					request.getSession().setAttribute("loginstation", stationService.findByStationId(baseService.findByAccount(account).getId()));
					return "station/station";
				}else {
					return "station/stationerror";
				}
				
			}else {
				String account="c"+request.getParameter("account");
				request.getSession().setAttribute("logincourier", courierService.findByCourierId(baseService.findByAccount(account).getId()));
				return "courier/courier";
			}
		}else {
			return "base/nologin";
		}
	}
	
	@RequestMapping(value="findPassword")
	public String findPassword() {
		return "base/findPassword";
	}
	
	@RequestMapping("/register")
	public String register() {
		return "base/register";
	}
}
