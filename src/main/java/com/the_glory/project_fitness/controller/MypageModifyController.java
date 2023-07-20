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

import com.the_glory.project_fitness.service.FitnessService;
import com.the_glory.project_fitness.service.MypageModifyService;

@Controller

public class MypageModifyController {

    @Autowired
    MypageModifyService mypageModifyService;

    // @GetMapping({ "/mypageModify" })
    // public ModelAndView main(ModelAndView modelAndView) {
    //     modelAndView.addObject("name", "bwh");
    //     modelAndView.setViewName("/WEB-INF/views/Fitness/mypageModify.jsp");
    //     return modelAndView;
    // }

    // /carInfor/selectDetail/{CAR_INFOR_ID} 경로로 GET 요청이 들어오면 실행되는 메소드
    @GetMapping("/selectDetail/{ID}")
    public ModelAndView selectDetail(@PathVariable String ID, @RequestParam Map params, ModelAndView ModelAndView) {
        Object result = mypageModifyService.selectDetail(ID, params);
        ModelAndView.addObject("params", params);
        ModelAndView.addObject("result", result);   

        // modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        ModelAndView.setViewName("/WEB-INF/views/Fitness/mypageModify.jsp");
        return ModelAndView;
    }

    
}
