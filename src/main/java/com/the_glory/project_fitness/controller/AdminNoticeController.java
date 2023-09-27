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

import com.the_glory.project_fitness.service.CommonService;
import com.the_glory.project_fitness.service.NoticeService;

@Controller
public class AdminNoticeController {
    @Autowired
    CommonService fitnessService;

    @Autowired
    NoticeService noticeService;
    

    @GetMapping({"/Adminnotice"})
    public ModelAndView Adminnotice(@RequestParam Map dataMap, ModelAndView modelAndView) {
        Object result = noticeService.selectSearchWithPagination(dataMap);
        modelAndView.addObject("params", dataMap);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/Admin_notice.jsp");
        return modelAndView;
    }

    @GetMapping({"/AdminnoticeDelete"})
    public ModelAndView AdminnoticeDelete(@RequestParam Map dataMap, ModelAndView modelAndView) {        
        noticeService.memdelete(dataMap);
        Object result = noticeService.selectSearchWithPagination(dataMap);
        modelAndView.addObject("params", dataMap);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/Admin_notice.jsp");
        return modelAndView;
    }
    @GetMapping({"/AdminnoticeUpdata"})
    public ModelAndView AdminnoticeUpdata(@RequestParam Map params, ModelAndView modelAndView) {             
        modelAndView.addObject("params", params);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/AdminNoticeMemoUpdata.jsp");
        return modelAndView;
    }
    @PostMapping({"/AdminnoticeUpdataSelect"})
    public ModelAndView AdminnoticUpdataselect(@RequestParam Map dataMap, ModelAndView modelAndView) {        
        noticeService.noticeUpdate(dataMap);
        Object result = noticeService.selectSearchWithPagination(dataMap);
        modelAndView.addObject("params", dataMap);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/Admin_notice.jsp");
        return modelAndView;
    }
}
