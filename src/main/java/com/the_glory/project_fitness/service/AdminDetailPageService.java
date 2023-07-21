package com.the_glory.project_fitness.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.the_glory.project_fitness.dao.SharedDao;

@Service
public class AdminDetailPageService {
    @Autowired
    SharedDao sharedDao;

    // 전체 회원 조회
    public Object selectAll(Map dataMap) {
        String sqlMapId = "AdminPage.selectAll";
        Object result = sharedDao.getList(sqlMapId, sqlMapId);

        return result;
    }

}
