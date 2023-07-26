package com.the_glory.project_fitness.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the_glory.project_fitness.UniqueID.UniqueID;
import com.the_glory.project_fitness.dao.SharedDao;


import com.the_glory.project_fitness.utils.Commons;

@Service
@Transactional
public class ReserveService {
    @Autowired
    SharedDao sharedDao;
    
    @Autowired
    Commons commons;

    public Object Insert(Map dataMap){
        String sql = "Reserve.insert";
        String reserveId = commons.getUniqueSequence();
        dataMap.put("RESERVATION_ID", reserveId);
        Object result = sharedDao.insert(sql, dataMap);
        return result;
    }

    public Object select(Map dataMap){
        String sql = "Reserve.select";
        Object result = sharedDao.getOne(sql, dataMap);
        return result;
    }
}
