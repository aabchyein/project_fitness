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
    @Autowired
    MypageService mypageService;

        public Object selectDetail(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "MypageModify.selectByUID";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

        public Object update(Map dataMap) {
        String sqlMapId = "MypageModify.mypagemodify";

        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
        }

        public Object updateAndSelect(Map dataMap) {
        this.update(dataMap);

        Object result = mypageService.memDetail(dataMap);
        return result;
        }

}
