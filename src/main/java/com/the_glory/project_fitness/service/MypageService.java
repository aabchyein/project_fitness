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

    public Object selectDetail(Map dataMap){
        String sqlMapId = "Mypage.MypageDetail";
        Object result = sharedDao.getOne(sqlMapId, dataMap);

        return result;
    }

    public Object ReserveList(Map dataMap){
    String sqlMapId = "Mypage.ReserveList";
    Object result = sharedDao.getList(sqlMapId, dataMap);

       return result;
    }

    public Object mypageUpdate(Map dataMap) {
        String sqlMapId = "Mypage.MypageUpdate";
        Object result = sharedDao.update(sqlMapId, dataMap);

        return result;
    }

    public Object mypageDelete(Map dataMap) {
        String sqlMapId = "Mypage.MypageDelete";
        Object result = sharedDao.delete(sqlMapId, dataMap);

        return result;
    }
}
