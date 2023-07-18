package com.the_glory.project_fitness.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.the_glory.project_fitness.dao.SharedDao;

@Service
public class MypageModifyService {
    @Autowired
    SharedDao sharedDao;

        public Object selectDetail(String ID, Map datMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Mypage.selectByUID"; // xml의 namespace와 각각 ID의 조합해서 유니크 아이디를 만듬
        HashMap dataMap = new HashMap<>();
        dataMap.put("ID", ID);

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

}
