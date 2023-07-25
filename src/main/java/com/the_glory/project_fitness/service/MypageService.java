package com.the_glory.project_fitness.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the_glory.project_fitness.dao.SharedDao;
import com.the_glory.project_fitness.utils.Paginations;

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
        Object result2 =  this.selecthWithPagination(dataMap);
        all.put("result", result);
        all.put("result1", result1);
        all.put("result2", result2);
        return all;
    }

    public Object reserDetail(Map dataMap) {
        String sql = "Mypage.reserDetail";
        Object result = sharedDao.getList(sql, dataMap);

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

    public Object selectTotal(Map dataMap) {
        String sqlMapId = "Mypage.selectTotal";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

        public Map selecthWithPagination(Map dataMap) {
        // 페이지 형성 위한 계산
        int totalCount = (int) this.selectTotal(dataMap);
        
        int currentPage =1;
        if (dataMap.get("currentPage") != null) {
            currentPage = Integer.parseInt((String) dataMap.get("currentPage")); // from client in param
        }

        Paginations paginations = new Paginations(totalCount, currentPage);
        HashMap result = new HashMap<>();
        result.put("paginations", paginations); // 페이지에 대한 정보
        
        // page record 수
        String sqlMapId = "Mypage.MypagePagination";
        dataMap.put("pageScale", paginations.getPageScale());
        dataMap.put("pageBegin", paginations.getPageBegin());

        result.put("resultList", sharedDao.getList(sqlMapId, dataMap)); // 표현된 레코드 정보
        return result;
    }
}
