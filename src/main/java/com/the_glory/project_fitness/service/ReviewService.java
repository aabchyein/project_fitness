package com.the_glory.project_fitness.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the_glory.project_fitness.dao.SharedDao;


import com.the_glory.project_fitness.utils.Commons;

@Service
@Transactional
public class ReviewService {
    @Autowired
    SharedDao sharedDao;
    
    @Autowired
    Commons commons;

    public Object selectAll(Map dataMap){
        String sql = "Review.selectAll";
        Object result = sharedDao.getList(sql, dataMap);
        return result;
    }

    public Object insert(Map dataMap) {
        String sql = "Review.insert";
        HashMap map = new HashMap<>();
        String reviewId = commons.getUniqueSequence();
        map.put("REVIEW_ID", reviewId);
        Object result = sharedDao.insert(sql, dataMap);
        return result;
    }

}
