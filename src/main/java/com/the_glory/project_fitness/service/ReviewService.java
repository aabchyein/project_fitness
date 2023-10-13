package com.the_glory.project_fitness.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the_glory.project_fitness.dao.SharedDao;


import com.the_glory.project_fitness.utils.Commons;
import com.the_glory.project_fitness.utils.Paginations;

@Service
@Transactional
public class ReviewService {
    @Autowired
    SharedDao sharedDao;
    
    @Autowired
    Commons commons;

    public Object SearchSelect(Map dataMap){
        String sql = "Review.CompanyNameSearch";
        Object result = sharedDao.getList(sql, dataMap);
        return result;
    }

    public Object selectAll(Map dataMap){
        Object result = this.selectPaging(dataMap);
        // Object result = sharedDao.getList(sql, dataMap);
        return result;
    }

    public Object insert(Map dataMap) {
        String sql = "Review.insert";
        HashMap map = new HashMap<>();
        String reviewId = commons.getUniqueSequence();
        map.put("REVIEW_ID", reviewId);
        Object result = sharedDao.insert(sql, dataMap);
        return result;
    }

    public Object selectCompanyName(Map dataMap){
        String sql = "Review.selectCompanyName";
        Object result = sharedDao.getList(sql, dataMap);
        return result;
    }
    public Object selectPaging(Map dataMap) {
            Object result = this.pagination(dataMap);
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
            String sqlMapId = "Review.selectSearchWithPagination";
            dataMap.put("pageScale", paginations.getPageScale());
            dataMap.put("pageBegin", paginations.getPageBegin());
    
            result.put("resultList", sharedDao.getList(sqlMapId, dataMap)); // 표현된 레코드 정보
            return result;
        }

        public int selectSearchTotal(Map dataMap) {
            // Object getOne(String sqlMapId, Object dataMap);
            String sqlMapId = "Review.selectTotal";
            // Object result = sharedDao.getList(sqlMapId, dataMap);
            // result.put("resultList", this.selectSearch(dataMap));
            return (int) sharedDao.getOne(sqlMapId, dataMap);
        }

        public Object selectReview(Map dataMap) {
            String sqlMapId = "Review.selectReview";
            Object result = sharedDao.getList(sqlMapId, dataMap);
            return result;
        }
}
