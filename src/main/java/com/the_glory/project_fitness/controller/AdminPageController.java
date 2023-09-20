package com.the_glory.project_fitness.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.the_glory.project_fitness.service.AdminPageService;


@Controller
public class AdminPageController {

    @Autowired
    AdminPageService adminpageService;

    // 회원 관리 리스트
    @GetMapping({ "/adminPage" })
    public ModelAndView selectAll(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = adminpageService.selectAll(params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/AdminPage.jsp");
        return modelAndView;
    }

    @GetMapping({ "/adminPowerSetting" })
    public ModelAndView AdminPowerSetting(ModelAndView modelAndView) {
      
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/AdminPowerSetting.jsp");
        return modelAndView;
    }

    // 회원 상세정보
        @GetMapping({ "/adminPageDetail" })
    public  ModelAndView selectDetail(@RequestParam Map params, ModelAndView modelAndView) {
        Object result1 = adminpageService.selectDetail(params);
        modelAndView.addObject("result1", result1);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/AdminDetailPage.jsp");
        return modelAndView;
    }

    // 회원 삭제
    @GetMapping("/adminPageDelete")
    public Object deleteAndSelectSearch(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = adminpageService.deleteAndSelectSearch(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/adminPage.jsp");
        return modelAndView;
    }
 
     @PostMapping("/admininsert")
    public Object Admininsert(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = adminpageService.AdminInsert(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/AdminPowerSetting.jsp");
        return modelAndView;
    }   

}
