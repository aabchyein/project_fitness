package com.the_glory.project_fitness.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.the_glory.project_fitness.service.CarInforsService;

@Controller
@RequestMapping("/carInfor")
public class CarInforsController {
    @Autowired
    CarInforsService carInforsService;

    @GetMapping({ "/", "/home", "/main" })
    public ModelAndView main(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = carInforsService.selectSearch(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        // modelAndView.addObject("params", "result");
        // modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        modelAndView.setViewName("/WEB-INF/views/Fitness/common_noticePage_test.jsp");
        return modelAndView;
    }

    @GetMapping("/selectInUID")
    public ResponseEntity selectInUID(@RequestBody Map paramMap) {
        Object result = null;
        try {
            result = carInforsService.selectInUID(paramMap);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(result);
        }

        return ResponseEntity.ok().body(result);
    }

    // /selectSearch?search=YEAR&words=2020
    // /selectSearch/CAR_NAME/소
    @GetMapping("/selectSearch")
    public ModelAndView selectSearch(@RequestParam Map params, ModelAndView modelAndView) {
        // Object result = carInforsService.selectSearch(params);
        Object result = carInforsService.selectSearch(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        // modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        modelAndView.setViewName("/WEB-INF/views/Fitness/common_noticePage_test.jsp");
        return modelAndView;
    }

    // delete with MVC
    @GetMapping("/deleteAndSelectSearch")
    public ModelAndView deleteAndSelectSearch(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = carInforsService.deleteAndSelectSearch(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        // modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        modelAndView.setViewName("/WEB-INF/views/Fitness/common_noticePage_test.jsp");
        return modelAndView;
    }

    // delete with MVC
    @PostMapping("/delete")
    public ModelAndView delete(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = carInforsService.delete(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        // modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        modelAndView.setViewName("/WEB-INF/views/Fitness/common_noticePage_test.jsp");
        return modelAndView;
    }

    @GetMapping("/selectAll/{CAR_INFOR_ID}")
    public ResponseEntity selectAll(@PathVariable String CAR_INFOR_ID) {
        Object result = carInforsService.selectAll(CAR_INFOR_ID);
        return ResponseEntity.ok().body(result);
    }

    // /carInfor/selectDetail/{CAR_INFOR_ID} 경로로 GET 요청이 들어오면 실행되는 메소드
    @GetMapping("/selectDetail/{CAR_INFOR_ID}")
    public ModelAndView selectDetail(@PathVariable String CAR_INFOR_ID, @RequestParam Map params, ModelAndView ModelAndView) {
        Object result = carInforsService.selectDetail(CAR_INFOR_ID, params);
        ModelAndView.addObject("params", params);
        ModelAndView.addObject("result", result);

        // modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        ModelAndView.setViewName("/WEB-INF/views/Fitness/detail_list.jsp");
        return ModelAndView;

    }

    // // /selectDetail/CI002
    // @GetMapping("/selectDetail/{CAR_INFOR_ID}")
    // public ResponseEntity selectDetail(@PathVariable String CAR_INFOR_ID ){
    // Object result = carInforsService.selectDetail(CAR_INFOR_ID);
    // return ResponseEntity.ok().body(result);
    // }

    // create
    @GetMapping("/insert")
    public ResponseEntity insert(@RequestBody Map paramMap) {
        Object result = carInforsService.insert(paramMap);
        return ResponseEntity.ok().body(result);
    }

    // insert and selectsearch
    @PostMapping("/insertAndSelectSearch")
    public ModelAndView insertAndSelectSearch(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = carInforsService.insertAndSelectSearch(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        // modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        modelAndView.setViewName("/WEB-INF/views/Fitness/common_noticePage_test.jsp");
        return modelAndView;
    }

    @GetMapping("/insertAndcome")
    public ModelAndView insertAndcome(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/Fitness/insert.jsp");
        return modelAndView;
    }

    // update
    @PutMapping("/update")
    public ResponseEntity update(@RequestBody Map paramMap) {
        Object result = carInforsService.update(paramMap);
        return ResponseEntity.ok().body(result);
    }

    // update and selectsearch
    @PostMapping("/updateAndSelectSearch")
    public ModelAndView updateAndSelectSearch(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = carInforsService.updateAndSelectSearch(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);

        // modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        modelAndView.setViewName("/WEB-INF/views/Fitness/common_noticePage_test.jsp");
        return modelAndView;
    }

    @GetMapping("/updateAndcome")
    public ModelAndView updatetAndcome(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("/WEB-INF/views/Fitness/update.jsp");
        return modelAndView;
    }

}