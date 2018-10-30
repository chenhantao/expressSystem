package cn.edu.cqu.cht.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author CHT
 * @date 创建时间：2018年4月10日 下午8:36:45
 * @version 1.0
 */
@Controller
public class IndexController {
	@RequestMapping(value= {"","/index"})
	public ModelAndView dicts() {
		ModelAndView mv=new ModelAndView("index");
		mv.addObject("now",new Date());
		return mv;
	}
}
