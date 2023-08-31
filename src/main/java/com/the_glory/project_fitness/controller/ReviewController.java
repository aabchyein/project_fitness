package com.the_glory.project_fitness.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.the_glory.project_fitness.service.CommonService;
import com.the_glory.project_fitness.service.ReviewService;


@Controller
public class ReviewController {
    @Autowired
    CommonService fitnessService;
    @Autowired
    ReviewService reviewService;

    @GetMapping({"/Review"})
    public ModelAndView main(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = reviewService.selectAll(params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Review/Review.jsp");
        return modelAndView;
    }

    @GetMapping("/insert")
    public ModelAndView insert(@RequestParam Map paramMap, ModelAndView modelAndView) {
        Object result = reviewService.insert(paramMap);

        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Review/Review.jsp");
        return modelAndView;
    }
}
