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

import com.the_glory.project_fitness.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    NoticeService noticeService;

    @GetMapping({"/Notice"})
    public ModelAndView main(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = noticeService.selectSearch(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        
        // modelAndView.addObject("params", "result");
        modelAndView.setViewName("/WEB-INF/views/Fitness/Notice/Notice.jsp");
        return modelAndView;
    }

   @GetMapping({"/LoginFromNotice"})
    public ModelAndView main(ModelAndView modelAndView) {
        modelAndView.addObject("name", "bwh");
        modelAndView.setViewName("/WEB-INF/views/Fitness/Login/Login2.jsp");
        return modelAndView;
    }

    @GetMapping("/memberDelete")
    public Object memberdelete(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = noticeService.memdelete(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/adminPage.jsp");
        return modelAndView;
    }

}
