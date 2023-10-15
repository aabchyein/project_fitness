package com.the_glory.project_fitness.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the_glory.project_fitness.dao.SharedDao;

@Service
@Transactional

public class ChartPageService {
    
    @Autowired
    SharedDao sharedDao;

    public Object genderstatic(Map dataMap){
        String sql =  "ChartPage.genderstatic";
        Object result = sharedDao.getList(sql, dataMap);
        return result;
    }

    public Object piechart(Map data){
        String sql = "ChartPage.piechart";
        Object result = sharedDao.getList(sql, data);
        return result;
    }

    public Object linechart(Map data){
        String sql = "ChartPage.linechart";
        Object result = sharedDao.getList(sql, data);
        return result;
    }
}
