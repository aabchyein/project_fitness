package com.the_glory.project_fitness.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.the_glory.project_fitness.UniqueID.UniqueID;
import com.the_glory.project_fitness.service.CarInforsService;
import com.the_glory.project_fitness.service.CommonService;
import com.the_glory.project_fitness.service.ReserveService;
@Controller


    



@RequestMapping("/guest")
public class ReserveController {  
    @Autowired
    ReserveService reserveService;

    @GetMapping({"/reserve"})
    public ModelAndView main(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = reserveService.select(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Reserve/reserve.jsp");
        return modelAndView;
    }

     @GetMapping({"/reserveinsert"})
    public ModelAndView insert(@RequestParam Map paramMap, ModelAndView modelAndView) {
        Object result = reserveService.Insert(paramMap);

        modelAndView.setViewName("/WEB-INF/views/Fitness/GYM/gym_login.jsp");
        return modelAndView;
    }
    }
           
