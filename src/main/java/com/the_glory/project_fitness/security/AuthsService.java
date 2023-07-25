package com.the_glory.project_fitness.security;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the_glory.project_fitness.dao.SharedDao;

@Service
@Transactional
public class AuthsService {

    @Autowired
    SharedDao sharedDao;

    @Autowired
    Commons commonUtils;

    public Object insert(Map dataMap) {
        List authList = new ArrayList<>();
        authList.add("ROLE_GUEST");  // default auth
        authList.add(dataMap.get("auth"));  // choosed auth
        dataMap.put("authList", authList);

        String sqlMapId = "Auths.insert";
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }
    //권한을 같이 넣어주는것
    public Map selectWithUSERNAME(Map dataMap) {
        String sqlMapId = "Auths.selectWithUSERNAME";
        
        HashMap result = new HashMap<>();
        result.put("resultList", sharedDao.getList(sqlMapId, dataMap));
        return result;
    }
}