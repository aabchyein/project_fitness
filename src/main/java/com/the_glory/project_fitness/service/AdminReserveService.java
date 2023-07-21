package com.the_glory.project_fitness.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.the_glory.project_fitness.dao.SharedDao;

@Service
public class AdminReserveService {
    @Autowired
    SharedDao sharedDao;

    // 회원 정보 삭제
    public Object memberdelete(Map params) {
        String sqlMapId = "AdminReserve.memdelete";

        Object result = sharedDao.delete(sqlMapId, params);
        return result;
    }
}
