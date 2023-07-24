package com.the_glory.project_fitness.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.the_glory.project_fitness.service.FitnessService;
import com.the_glory.project_fitness.service.MypageModifyService;

import ch.qos.logback.core.model.Model;

@Controller

public class MypageModifyController {

    @Autowired
    MypageModifyService mypageModifyService;

    @GetMapping("/mypageModify")
    public ModelAndView selectDetail(@RequestParam Map params, ModelAndView ModelAndView) {
        Object result = mypageModifyService.selectDetail(params);
        ModelAndView.addObject("params", params);
        ModelAndView.addObject("result", result);   

        // modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        ModelAndView.setViewName("/WEB-INF/views/Fitness/Mypage/mypageModify.jsp");
        return ModelAndView;
    }

    @GetMapping("/updateAndSelect")
    public ModelAndView updateAndSelect(@RequestParam Map params, ModelAndView ModelAndView){
        Object result = mypageModifyService.updateAndSelect(params);

        ModelAndView.addObject("result", result);   
        ModelAndView.setViewName("/WEB-INF/views/Fitness/Mypage/mypage.jsp");
        return ModelAndView;
    }
    
}
