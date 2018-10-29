package cn.edu.cqu.cht.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import cn.edu.cqu.cht.function.CreateOrderNum;
import cn.edu.cqu.cht.function.MD5;
import cn.edu.cqu.cht.function.Test;
import cn.edu.cqu.cht.model.Base;
import cn.edu.cqu.cht.model.Orderlist;
import cn.edu.cqu.cht.model.User;
import cn.edu.cqu.cht.service.BaseService;
import cn.edu.cqu.cht.service.OrderlistService;
import cn.edu.cqu.cht.service.UserService;

/**
 * @author CHT
 * @date 创建时间：2018年5月21日 上午3:49:48
 * @version 1.0
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private BaseService baseService;
	@Autowired
	private OrderlistService orderlistService;

	@RequestMapping("/changeuserinfo")
	public String changeUserInfo(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("loginuser");
		user.setUserName(request.getParameter("change_user_name"));
		user.setPhoneNum(request.getParameter("change_phone"));
		user.setEmail(request.getParameter("change_email"));
		user.setAddr1(request.getParameter("change_addr"));
		user.setAddr2(request.getParameter("change_addr2"));
		user.setAddr3(request.getParameter("change_addr3"));
		userService.updateUser(user);
		return "user/changesuccess";
	}

	@RequestMapping("/changeuserpassword")
	public String changeUserPassword(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("loginuser");
		Base base = baseService.findById(user.getUserId());
		base.setPassword(MD5.getInstance().getMD5(request.getParameter("change_new_password")));
		if (baseService.updatePassword(base)) {
			return "user/changesuccess";
		} else {
			return "base/error";
		}
	}

	@RequestMapping("/sendexpress")
	public String sendExpress(HttpServletRequest request,Model model) {
		User user = (User) request.getSession().getAttribute("loginuser");
		String senderAddr = new String();
		if (request.getParameter("new_sender_addr") != null) {
			senderAddr = request.getParameter("new_sender_addr");
		} else {
			senderAddr = request.getParameter("new_sender_addr2");
		}
		String orderId = CreateOrderNum.getInstance().init(user.getUserId());
		

		String[] strings1 = new String[3];
		int num1 = 0;
		String[] strings2 = new String[3];
		int num2 = 0;
		String sAddr = request.getParameter("addr-show");
		String rAddr = request.getParameter("addr-show2");
		StringBuilder temp = new StringBuilder();
		for (int i = 0; i < sAddr.length(); i++) {
			if (sAddr.charAt(i) != '-') {
				temp.append(String.valueOf(sAddr.charAt(i)));
			} else {
				strings1[num1] = temp.toString();
				num1++;
				temp = new StringBuilder();
			}
		}
		StringBuilder temp2 = new StringBuilder();
		for (int i = 0; i < rAddr.length(); i++) {
			if (rAddr.charAt(i) != '-') {
				temp2.append(String.valueOf(rAddr.charAt(i)));
			} else {
				strings2[num2] = temp2.toString();
				num2++;
				temp2 = new StringBuilder();
			}
		}

		if (orderlistService.addOrder(orderId, user.getUserId(), request.getParameter("new_sender_name"),
				request.getParameter("new_sender_phone"), strings1[0], strings1[1], strings1[2], senderAddr,
				request.getParameter("new_recipient_name"), request.getParameter("new_recipient_phone"), strings2[0],
				strings2[1], strings2[2], request.getParameter("new_recipient_addr"), request.getParameter("new_kind"),
				Double.valueOf(request.getParameter("new_weight")), request.getParameter("new_notes"))) {
			user.setHistoryAddr(request.getParameter("new_recipient_addr"));
			userService.updateUser(user);
			request.getSession().setAttribute("loginuser", user);
			model.addAttribute("thismoney", orderlistService.findByOrderId(orderId).getMoney());
			model.addAttribute("thisorderid", orderId);
			return "user/pay";
		} else {
			return "base/error";
		}

	}

	@RequestMapping("/afterpay")
	public String afterPay(HttpServletRequest request,String orderId,Model model) {
		model.addAttribute("thismoney", orderlistService.findByOrderId(orderId).getMoney());
		model.addAttribute("thisorderid", orderId);
		return "user/pay";
	}
	@RequestMapping("/pay")
	public String changePay(HttpServletRequest request,String orderId) {
		Orderlist order = orderlistService.findByOrderId(orderId);
		order.setPayState((short) 1);
		if (orderlistService.updateOrder(order)) {
			return "user/paysuccess";
		} else {
			return "base/error";
		}
	}

	@RequestMapping("/userorders")
	public String userOrder(HttpServletRequest request,@RequestParam(required=true,defaultValue="1")Integer page,Model model,@RequestParam(required=true,defaultValue="6")Integer limit) {
		User user=(User)request.getSession().getAttribute("loginuser");
		
		List<Orderlist> orderlists=orderlistService.findByUserId(user.getUserId(), page, limit);
		PageInfo<Orderlist> p=new PageInfo<Orderlist>(orderlists);
		model.addAttribute("page", p);
		model.addAttribute("userlist", orderlists);
		model.addAttribute("limit",limit);
		return "user/userorders";
	}
	
	@RequestMapping(value="/checklogistics",method=RequestMethod.GET)
	public String checkLogistice(HttpServletRequest request,Model model,String orderId) {
		Orderlist orderlist=orderlistService.findByOrderId(orderId);
		String logistics=orderlist.getLogisticsState();
		List<String> list=new ArrayList<String>();
		if(logistics!=null && !logistics.equals("")) {
			list=Test.getInstance().showLogistics(logistics);
			model.addAttribute("logistics", list);
			return "user/checklogistics";
		}else {
			list.add("对不起，暂无物流状态");
			model.addAttribute("logistics", list);
			return "user/checklogistics";
		}
	}
	
	@RequestMapping("/userinfo")
	public String userInfo() {
		return "user/userinfo";
	}

	@RequestMapping("/userpassword")
	public String userPassword() {
		return "user/userpassword";
	}

	@RequestMapping("/usersend")
	public String userSend() {
		return "user/usersend";
	}

	@RequestMapping("/userquit")
	public String userQuit(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "base/base";
	}

	@RequestMapping("/welcomeuser")
	public String welcomeUser() {
		return "user/welcomeuser";
	}

	@RequestMapping("/userMenu")
	public String userMenu() {
		return "user/usermenu";
	}

	@RequestMapping("/showPage")
	public String showPage() {
		return "user/showpage";
	}
}
