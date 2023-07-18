package com.the_glory.project_fitness.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.the_glory.project_fitness.service.MypageService;

@RestController
public class MypageController {
    @Autowired
    MypageService mypageService;

    @GetMapping({ "/mypageconnect" })
    public ModelAndView main(ModelAndView modelAndView) {
        modelAndView.addObject("name", "bwh");
        modelAndView.setViewName("/WEB-INF/views/Fitness/mypage.jsp");
        return modelAndView;
    }

    @GetMapping("/mypage")
    public ResponseEntity Mypage(@PathVariable Map paramMap, ModelAndView modelAndView) {
        Object result = mypageService.selectDetail(paramMap);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/mypage.jsp");
        return ResponseEntity.ok().body(result);
    }
}
