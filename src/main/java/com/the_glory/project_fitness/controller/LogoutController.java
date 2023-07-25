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

@Controller
public class LogoutController {

    @GetMapping({ "/Logout" }) // 로그아웃 폼 작성
    public ModelAndView logoutForm(ModelAndView modelAndView) {
        String viewName = "/WEB-INF/views/Fitness/Logout/Logout.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
}
