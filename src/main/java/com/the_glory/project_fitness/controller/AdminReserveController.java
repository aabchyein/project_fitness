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

    @GetMapping("/adminReserve")
    public Object adminReserve(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = adminReserveService.reserveSelectAll(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/AdminReserve.jsp");
        return modelAndView;
    }

    // 예약 정보 삭제
    @GetMapping("/adminReserveDelete")
    public Object adminReserveDelete(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = adminReserveService.reservedelete(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/AdminReserve.jsp");
        return modelAndView;
    }

    // 예약 정보 수정
    @GetMapping("/adminReserveUpdate")
    public Object adminReserveUpdate(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = adminReserveService.reserveupdate(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/AdminReserve.jsp");
        return modelAndView;
    }
}
