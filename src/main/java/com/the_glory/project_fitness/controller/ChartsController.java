package com.the_glory.project_fitness.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.the_glory.project_fitness.service.AdminPageService;

@Controller
public class ChartsController {
    @Autowired
    private Gson gson;
    
    @Autowired
    AdminPageService adminPageService;

    


    @RequestMapping(value = "/charts/google_charts_scatter", method = RequestMethod.GET)  
    public ModelAndView edit(ModelAndView modelAndView) {
        ArrayList datas = new ArrayList();
        // ['Age', 'Weight'],[8, 12],[4, 5.5],[11, 14],[4, 5],[3, 3.5],[6.5, 7];
        datas.add(Arrays.asList("Age", "Weight"));
        datas.add(Arrays.asList(8, 12));
        datas.add(Arrays.asList(4, 5.5));
        datas.add(Arrays.asList(11, 14));
        datas.add(Arrays.asList(4, 5));
        datas.add(Arrays.asList(3, 3.5));
        datas.add(Arrays.asList(6.5, 7));
        ArrayList dataArray = new ArrayList<>();
        dataArray.add(datas);

        modelAndView.addObject("dataArray", gson.toJson(datas));
        
        modelAndView.setViewName("/WEB-INF/views/chart/charts_google_various.jsp");
        return modelAndView;
    }
    
    @GetMapping("/genderstatic")
    public ResponseEntity genderstatic(@RequestParam Map paramMap) {
        // 여기서 paramMap을 사용하여 작업을 수행하고 결과 데이터를 생성합니다.
        Object result = adminPageService.genderstatic(paramMap);
       

        // ResponseEntity를 사용하여 JSON 응답을 반환합니다.
        return ResponseEntity.ok().body(result);
    }
}
