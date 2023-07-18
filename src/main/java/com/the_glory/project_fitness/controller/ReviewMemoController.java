package com.the_glory.project_fitness.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.the_glory.project_fitness.service.FitnessService;

@Controller
<<<<<<<< HEAD:src/main/java/com/the_glory/project_fitness/controller/Review_memoController.java
public class Review_memoController {
========

public class ReviewMemoController {

>>>>>>>> 0c83d2a03b0b5ad4598c233976f4043f89ef2a9b:src/main/java/com/the_glory/project_fitness/controller/ReviewMemoController.java
    @Autowired
    FitnessService fitnessService;

    @GetMapping({"/Reviewmemo"})
    public ModelAndView main(ModelAndView modelAndView) {
        modelAndView.addObject("name", "bwh");
        modelAndView.setViewName("/WEB-INF/views/Fitness/Review_memo.jsp");
        return modelAndView;
    }
}
