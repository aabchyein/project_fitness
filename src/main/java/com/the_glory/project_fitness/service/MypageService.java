package com.the_glory.project_fitness.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the_glory.project_fitness.dao.SharedDao;

@Service
@Transactional
public class MypageService {
    @Autowired
    SharedDao sharedDao;

    public Object selectDetail(String ID, Map dataMap){
        String sqlMapId = "Mypage.MypageDetail";
        Object result = sharedDao.getList(sqlMapId, dataMap);

        return result;
    }

}
