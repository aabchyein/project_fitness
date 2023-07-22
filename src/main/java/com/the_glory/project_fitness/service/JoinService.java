package com.the_glory.project_fitness.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the_glory.project_fitness.dao.SharedDao;

@Service
@Transactional
public class JoinService {
    @Autowired
    SharedDao sharedDao;

    public Object JoinInsert(Map dataMap){
        String sql = "join.insert";
        Object result = sharedDao.insert(sql, dataMap);
        return result;
    }
}
