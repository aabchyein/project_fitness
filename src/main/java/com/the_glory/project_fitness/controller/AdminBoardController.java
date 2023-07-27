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

import com.the_glory.project_fitness.service.AdminBoardAnswerService;
import com.the_glory.project_fitness.service.AdminBoardService;

@Controller
@RequestMapping("/fitness")
public class AdminBoardController {
    @Autowired
    AdminBoardService adminBoardService;

    @Autowired
    AdminBoardAnswerService adminBoardAnswerService;

    // @GetMapping({"/AdminBoard"})
    // public ModelAndView main(ModelAndView modelAndView) {
    // modelAndView.addObject("name", "bwh");
    // modelAndView.setViewName("/WEB-INF/views/Fitness/Admin_board.jsp");
    // return modelAndView;
    // }

    // 전체 화면
    @GetMapping({ "/AdminBoardAll" })
    public ModelAndView main(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = adminBoardService.selectAll(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/Admin_board.jsp");
        return modelAndView;
    }

    // delete 삭제 버튼
    @GetMapping("/deleteAndSelectSearch")
    public ModelAndView deleteAndSelectSearch(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = adminBoardService.deleteAndSelectSearch(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        // modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/Admin_board.jsp");
        return modelAndView;
    }

    // Mypageupdate 업데이트 버튼
    // @GetMapping("/AdminBoardupdate/{ID}")
    // public ModelAndView update(@PathVariable String ID, @RequestParam Map
    // paramMap, ModelAndView modelAndView) {
    // Object result = adminBoardService.AdminBoardupdate(ID, paramMap);
    // modelAndView.addObject("result", result);
    // modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/Admin_board.jsp");

    // return modelAndView;
    // }

    // // insert답변 등록 버튼
    // @PostMapping("/insert")
    // public ResponseEntity insert(@RequestBody Map paramMap) {
    // Object result = adminBoardAnswerService.insert(paramMap);
    // return ResponseEntity.ok().body(result);
    // }

    // // insertAndSelectSearch답변 등록 버튼
    // @GetMapping("/insertAndSelectSearch")
    // public ResponseEntity insertAndSelectSearch(@RequestBody Map paramMap) {
    // Object result = adminBoardService.insertAndSelectSearch(paramMap);
    // return ResponseEntity.ok().body(result);
    // }

    // insert and selectsearch
    @GetMapping("/insertAndSelectSearch")
    public ModelAndView insertAndSelectSearch(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = adminBoardAnswerService.insert(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.addObject("params", "result");
        // modelAndView.setViewName("/WEB-INF/views/carinfor/list_map.jsp");
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/Admin_board.jsp");
        return modelAndView;
    }

    // // 등록버튼 링크
    // @GetMapping("/insertAndcome/{BOARD_ID}")
    // public ModelAndView insertAndcome(@RequestParam Map params, ModelAndView
    // modelAndView) {
    // Object result = adminBoardService.selectDetail(params);
    // modelAndView.addObject("params", params);
    // modelAndView.addObject("result", result);
    // modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/AdminBoardAnswer.jsp");
    // return modelAndView;
    // }

    @GetMapping("/insertAndcome")
    public ModelAndView insertAndcome(@RequestParam Map params, ModelAndView modelAndView) {

        Object record = adminBoardService.selectDetail(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("record", record);

        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/AdminBoardAnswer.jsp");
        return modelAndView;
    }

    // insertAnswer답변 등록 버튼

    @GetMapping("/Adminboardinsert")
    public ModelAndView Adminboardinsert(@RequestParam Map paramMap, ModelAndView modelAndView) {
        modelAndView.addObject("paramMap", paramMap);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/AdminBoardAnswer.jsp");

        return modelAndView;
    }

    @GetMapping("/selectSearch")
    public ModelAndView selectSearch(@RequestParam Map params, ModelAndView modelAndView) {
        Object result = adminBoardService.selectSearch(params);
        modelAndView.addObject("params", params);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/AdminBoardAnswer.jsp");
        return modelAndView;
    }

    // // /selectDetail/BOARD01
    // @GetMapping("/SelectDetail/{BOARD_ID}")
    // public ModelAndView selectDetail(@PathVariable Map BOARD_ID, ModelAndView
    // modelAndView) {
    // Object result = adminBoardService.selectDetail(BOARD_ID);
    // modelAndView.addObject("params", params);
    // modelAndView.addObject("result", result);
    // modelAndView.setViewName("/WEB-INF/views/Fitness/Admin/AdminBoardAnswer.jsp");
    // return modelAndView;
    // }

}
