package com.the_glory.project_fitness.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.the_glory.project_fitness.service.MypageService;

@RestController
public class MypageController {
    @Autowired
    MypageService mypageService;

    // @GetMapping({ "/mypageconnect" })
    // public ModelAndView main(ModelAndView modelAndView) {
    // modelAndView.addObject("name", "bwh");
    // modelAndView.setViewName("/WEB-INF/views/Fitness/mypage.jsp");
    // return modelAndView;
    // }

    @GetMapping("/mypage")
    public ModelAndView Mypage(@RequestParam Map paramMap, ModelAndView modelAndView) {
        Object result = mypageService.memDetail(paramMap);
        modelAndView.addObject("paramMap", paramMap);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Mypage/mypage.jsp");

        return modelAndView;
    }

    @GetMapping("/mypageReserve")
    public ModelAndView selectDetail(@RequestParam Map params, ModelAndView ModelAndView) {
        Object result1 = mypageService.ReserveList(params);
        ModelAndView.addObject("params", params);
        ModelAndView.addObject("result1", result1);   

        ModelAndView.setViewName("/WEB-INF/views/Fitness/Mypage/mypage.jsp");
        return ModelAndView;
    }

    @GetMapping("/mypageupdate")
    public ModelAndView Mypageupdate(@RequestParam Map paramMap, ModelAndView modelAndView) {
        Object result = mypageService.UpdateAndSelect(paramMap);
        modelAndView.addObject("result", result);
        modelAndView.addObject("paramMap", paramMap);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Mypage/mypage.jsp");

        return modelAndView;
    }

    @PostMapping("/mypagedelete")
    public ModelAndView Mypagedelete(@RequestParam Map paramMap, ModelAndView modelAndView) {
        Object result = mypageService.deleteAndSelect(paramMap);
        modelAndView.addObject("result", result);
        modelAndView.addObject("paramMap", paramMap);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Mypage/mypage.jsp");

        return modelAndView;
    }
     @GetMapping("/mypagereserve")
    public ModelAndView mypagereserve(@RequestParam Map paramMap,ModelAndView modelAndView) {
        modelAndView.addObject("paramMap", paramMap);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Mypage/mypagereserve.jsp");

        return modelAndView;
    }
}
