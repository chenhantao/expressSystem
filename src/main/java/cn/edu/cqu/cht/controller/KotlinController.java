package cn.edu.cqu.cht.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.cqu.cht.service.KotlinService;

/**
 * @author chenhantao
 * @since 2018/11/2
 */
@Controller
@RequestMapping("/kotlin")
public class KotlinController {
    @Autowired
    KotlinService kotlinService;

    @GetMapping("/find")
    public String find(HttpServletRequest request){
        return "";
    }
}
