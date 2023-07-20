package com.the_glory.project_fitness.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.the_glory.project_fitness.service.FitnessService;

@Controller

public class  AdminGymController {
    @Autowired
    FitnessService fitnessService;

    @GetMapping({"/adminGym"})
    public ModelAndView main(ModelAndView modelAndView) {
        modelAndView.addObject("name", "bwh");
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/adminGym.jsp");
        return modelAndView;
    }
}
