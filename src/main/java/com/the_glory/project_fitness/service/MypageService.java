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

    public Object memDetail(Map dataMap) {
        String sql = "Mypage.memDetail";
        String sql1 = "Mypage.reserDetail";
        HashMap all = new HashMap<>();

        Object result = sharedDao.getList(sql, dataMap);
        Object result1 = sharedDao.getList(sql1, dataMap);
        all.put("result", result);
        all.put("result1", result1);
        return all;
    }

    public Object reserDetail(Map dataMap) {
        String sql = "Mypage.reserDetail";
        Object result = sharedDao.getList(sql, dataMap);

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

    public Object deleteAndSelect(Map dataMap) { // 파라미터가 Map형식이다.

        this.mypageDelete(dataMap);

        // sqlMapId = "CarInfors.selectsearch";
        Object result = this.memDetail(dataMap);

        return result;

    }

    public Object UpdateAndSelect(Map dataMap) { // 파라미터가 Map형식이다.

        this.mypageUpdate(dataMap);

        // sqlMapId = "CarInfors.selectsearch";
        Object result = this.memDetail(dataMap);

        return result;

    }

}
