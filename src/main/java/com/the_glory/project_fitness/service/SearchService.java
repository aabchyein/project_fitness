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
public class SearchService {
    @Autowired
    SharedDao sharedDao;

        // 검색
        public Object selectSearch(Map dataMap) {
            String sqlMapId = "Search.selectSearchWithPagination";
    
            Object result = sharedDao.getList(sqlMapId, dataMap);
            return result;
        }
}
