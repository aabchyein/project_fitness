package com.the_glory.project_fitness.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.the_glory.project_fitness.service.AdminReserveService;

@Controller
public class AdminReserveController {
    @Autowired
    AdminReserveService adminReserveService;

    // 회원 정보 삭제
    @GetMapping("/adminReserveDelete")
    public Object memberdelete(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = adminReserveService.memberdelete(params);
        modelAndView.addObject("params", params);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/Admin_reserve.jsp");
        return modelAndView;
    }
}
