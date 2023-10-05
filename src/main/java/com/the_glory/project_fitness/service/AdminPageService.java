package com.the_glory.project_fitness.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the_glory.project_fitness.dao.SharedDao;
import com.the_glory.project_fitness.utils.Paginations;

@Service
@Transactional
public class AdminPageService {
    @Autowired
    SharedDao sharedDao;

    @Autowired
    NoticeService noticeService;

    // 전체 회원 조회
    public Object selectAll(Map dataMap) {
        Object result = this.pagination(dataMap);

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
        String sqlMapId3 = "Notice.memdelete";
        String sqlMapId4 = "AdminReserve.memdelete";
        String sqlMapId5 = "AdminPage.memdelete";

        Object result1 = sharedDao.delete(sqlMapId1, params);
        Object result2 = sharedDao.delete(sqlMapId2, params);
        Object result3 = sharedDao.delete(sqlMapId3, params);
        Object result4 = sharedDao.delete(sqlMapId4, params);
        Object result5 = sharedDao.delete(sqlMapId5, params);

        ArrayList result = new ArrayList<>();
        result.add(this.selectAll(params));
        return result;
    }

    public Object AdminInsert(Map params){
        String sqlMap = "AdminPage.insert";
       Object result = sharedDao.insert(sqlMap, params);

            
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
        String sqlMapId = "AdminPage.selectSearchWithPagination";
        dataMap.put("pageScale", paginations.getPageScale());
        dataMap.put("pageBegin", paginations.getPageBegin());

        result.put("resultList", sharedDao.getList(sqlMapId, dataMap)); // 표현된 레코드 정보
        return result;
    }

        public int selectSearchTotal(Map dataMap) {
            // Object getOne(String sqlMapId, Object dataMap);
            String sqlMapId = "AdminPage.selectTotal";
            // Object result = sharedDao.getList(sqlMapId, dataMap);
            // result.put("resultList", this.selectSearch(dataMap));
            return (int) sharedDao.getOne(sqlMapId, dataMap);
        }
    
}
