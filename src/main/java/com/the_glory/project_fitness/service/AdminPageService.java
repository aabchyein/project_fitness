package com.the_glory.project_fitness.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the_glory.project_fitness.dao.SharedDao;

@Service
@Transactional
public class AdminPageService {
    @Autowired
    SharedDao sharedDao;

    // 전체 회원 조회
    public Object selectAll(Map dataMap) {
        String sqlMapId = "AdminPage.selectAll";
        Object result = sharedDao.getList(sqlMapId, sqlMapId);

        return result;
    }

    // 회원 상세 정보 조회
    public Object selectDetail(Map dataMap) {
        String sqlMapId = "AdminPage.selectDetail";
        Object result = sharedDao.getOne(sqlMapId, dataMap);

        return result;
    }

    // 회원 정보 삭제
    public Object deleteAndSelectSearch(Map params) {
        HashMap result = new HashMap<>();
        result.put("deleteCount", this.delete(params));

        return result;
    }

    // 회원 정보 삭제2(FK 삭제 후 PK 삭제) 후 출력
    public Object delete(Map params) {
        String sqlMapId1 = "AdminBoardAnswer.memdelete";
        String sqlMapId2 = "AdminBoard.memdelete";
        String sqlMapId3 = "AdminPage.memdelete";
        String sqlMapId = "AdminPage.selectAll";
        Object result1 = sharedDao.delete(sqlMapId1, params);
        Object result2 = sharedDao.delete(sqlMapId2, params);
        Object result3 = sharedDao.delete(sqlMapId3, params);
        Object result = sharedDao.getList(sqlMapId, params);

        return result;
    }
}
