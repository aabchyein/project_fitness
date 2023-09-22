package com.the_glory.project_fitness.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.the_glory.project_fitness.service.FitnessService;
import com.the_glory.project_fitness.service.ReviewService;

@Controller
public class ReviewMemoController {


    @Autowired
    FitnessService fitnessService;

    @Autowired
    ReviewService reviewService;
    

    @GetMapping({"/Reviewmemo"})
    public ModelAndView main(ModelAndView modelAndView) {
        modelAndView.addObject("name", "bwh");
        modelAndView.setViewName("/WEB-INF/views/Fitness/Review/ReviewMemo.jsp");
        return modelAndView;
    }

    @GetMapping({"/ReviewCompanyName"})
    public ModelAndView ReviewCompanyName(@RequestParam Map paramMap, ModelAndView modelAndView) {
        Object result = reviewService.selectCompanyName(paramMap);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Review/ReviewMemo.jsp");
        return modelAndView;
    }

    @GetMapping({"/CompanyNameSearch"})
    public ModelAndView CompanyNameSearch(@RequestParam Map paramMap, ModelAndView modelAndView) {
        Object result = reviewService.SearchSelect(paramMap);
        modelAndView.addObject("result", result);
        modelAndView.addObject("params", paramMap);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Review/ReviewMemo.jsp");
        return modelAndView;
    }
}
