package com.the_glory.project_fitness.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.the_glory.project_fitness.dao.SharedDao;
import com.the_glory.project_fitness.utils.Paginations;

@Service
public class AdminReserveService {
    @Autowired
    SharedDao sharedDao;

    // 예약 정보 조회
    public Object reserveSelectAll(Map params) {
        String sqlMapId = "AdminReserve.reserveselectAll";

        Object result = this.pagination(params);
        return result;
    }    

    // 예약 정보 삭제
    public Object reservedelete(Map params) {
        String sqlMapId = "AdminReserve.reservedelete";
        sharedDao.delete(sqlMapId, params);

        Object result = this.reserveSelectAll(params);
        return result;
    }

    // 예약 정보 수정
    public Object reserveupdate(Map params) {
        String sqlMapId =  "AdminReserve.reserveupdate";
        sharedDao.update(sqlMapId, params);

        Object result = this.reserveSelectAll(params);
        return result;
    }
    public Map pagination(Map dataMap) {
        // 페이지 형성 위한 계산
        int totalCount = (int) this.selectSearchTotal(dataMap);
        
        int currentPage =1;
        if (dataMap.get("currentPage") != null) {
            currentPage = Integer.parseInt((String) dataMap.get("currentPage")); // from client in param
        }

        Paginations paginations = new Paginations(totalCount, currentPage);
        HashMap result = new HashMap<>();
        result.put("paginations", paginations); // 페이지에 대한 정보
        
        // page record 수
        String sqlMapId = "AdminReserve.selectSearchWithPagination";
        dataMap.put("pageScale", paginations.getPageScale());
        dataMap.put("pageBegin", paginations.getPageBegin());

        result.put("resultList", sharedDao.getList(sqlMapId, dataMap)); // 표현된 레코드 정보
        return result;
    }

        public int selectSearchTotal(Map dataMap) {
            // Object getOne(String sqlMapId, Object dataMap);
            String sqlMapId = "AdminReserve.selectTotal";
            // Object result = sharedDao.getList(sqlMapId, dataMap);
            // result.put("resultList", this.selectSearch(dataMap));
            return (int) sharedDao.getOne(sqlMapId, dataMap);
        }
}
