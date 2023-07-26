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

    // 예약 정보 조회
    public Object reserveSelectAll(Map params) {
        String sqlMapId = "AdminReserve.reserveselectAll";

        Object result = sharedDao.getList(sqlMapId, params);
        return result;
    }    

    // 예약 정보 삭제
    public Object reservedelete(Map params) {
        String sqlMapId = "AdminReserve.reservedelete";

        Object result = sharedDao.delete(sqlMapId, params);
        return result;
    }

    // 예약 정보 수정
    public Object reserveupdate(Map params) {
        HashMap result = new HashMap<>();
        String sqlMapId =  "AdminReserve.reserveupdate";
        result.put("update", sharedDao.update(sqlMapId, params));
        result.putAll((Map) this.reserveSelectAll(params));
        return result;
    }
}
