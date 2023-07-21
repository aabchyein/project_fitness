package com.the_glory.project_fitness.controller;

import java.util.HashMap;
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

import com.the_glory.project_fitness.service.CarInforsService;
import com.the_glory.project_fitness.service.CommonService;

@Controller
@RequestMapping("/common")
public class CommonController {
    @Autowired
    CommonService commonService;

    @GetMapping({ "/", "/home", "/main" })
    public ModelAndView main(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = commonService.selectAll(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        
        modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        return modelAndView;
    }

    @GetMapping("/SelectInUID")
    public ResponseEntity selectInUID(@RequestBody Map paramMap) {
        Object result = null;
        try {
            result = commonService.selectInUID(paramMap);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(result);
        }

        return ResponseEntity.ok().body(result);
    }

    // /selectSearch?search=YEAR&words=2020
    // /selectSearch/CAR_NAME/소
    @GetMapping("/SelectSearch")
    public ModelAndView selectSearch(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = commonService.selectSearch(params);
        //Object result = commonService.selectAll(params);

        HashMap rtnTmp = new HashMap<>();
        rtnTmp.put("resultList", result);

        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        return modelAndView;
    }


    // delete with MVC
    @PostMapping("/Delete")
    public ModelAndView delete(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = commonService.delete(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        return modelAndView;
    }

    // delete with MVC
    @GetMapping("/DeleteAndSelectSearch")
    public ModelAndView deleteAndSelectSearch(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = commonService.deleteAndSelectSearch(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        return modelAndView;
    }

    @GetMapping("/SelectAll/{COMMON_CODE_ID}")
    public ResponseEntity selectAll(@PathVariable Map CAR_INFOR_ID) {
        Object result = commonService.selectAll(CAR_INFOR_ID);
        return ResponseEntity.ok().body(result);
    }

    // /selectDetail/CI002
    @GetMapping("/SelectDetail/{COMMON_CODE_ID}")
    public ResponseEntity selectDetail(@PathVariable Map CAR_INFOR_ID) {
        Object result = commonService.selectDetail(CAR_INFOR_ID);
        return ResponseEntity.ok().body(result);
    }

    // create
    @PostMapping("/Insert")
    public ResponseEntity insert(@RequestBody Map paramMap) {
        Object result = commonService.insert(paramMap);
        return ResponseEntity.ok().body(result);
    }

    // insert and selectsearch
    @PostMapping("/InsertAndSelectSearch")
    public ModelAndView insertAndSelectSearch(@RequestParam Map params, ModelAndView modelAndView){
        Object result = commonService.insertAndSelectSearch(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        
        modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        return modelAndView;
    }

    @GetMapping("/InsertAndcome")
    public ModelAndView insertAndcome(@RequestParam Map params, ModelAndView modelAndView){
        
        modelAndView.setViewName("/WEB-INF/views/carinfor/insert.jsp");
        return modelAndView;
    }

    // update
    @PutMapping("/Update")
    public ResponseEntity update(@RequestBody Map paramMap) {
        Object result = commonService.update(paramMap);
        return ResponseEntity.ok().body(result);
    }

    //update and selectsearch
  @PostMapping("/UpdateAndSelectSearch")
    public ModelAndView updateAndSelectSearch(@RequestParam Map params, ModelAndView modelAndView){
        Object result = commonService.updateAndSelectSearch(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        
        modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        return modelAndView;
    }

    @GetMapping("/UpdateAndcome")
    public ModelAndView updatetAndcome(@RequestParam Map params, ModelAndView modelAndView){
        
        modelAndView.setViewName("/WEB-INF/views/carinfor/update.jsp");
        return modelAndView;
    }

}
