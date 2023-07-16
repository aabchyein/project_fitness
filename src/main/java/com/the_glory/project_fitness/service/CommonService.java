package com.the_glory.project_fitness.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the_glory.project_fitness.dao.SharedDao;

@Service
@Transactional
public class CommonService {
    @Autowired
    SharedDao sharedDao;

    // foreach HashMap.put("CAR_INFOR_ID_LIST", CAR_INFOR_ID_LIST)
    public Object selectInUID(Map dataMap) {
        String sqlMapId = "Common.selectInUID";

        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    // 검색(조건-search : COMPANY, CAR_NAME)
    // 검색(조건-search : YEAR, CAR_NAME)
    public Object selectSearch(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Common.selectSearch";

        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    // 검색(조건-search : YEAR, CAR_NAME)
    public Object selectSearch(String search, String words) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Common.selectSearch";
        HashMap dataMap = new HashMap<>();
        dataMap.put("search", search);
        dataMap.put("words", words);

        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object selectAll(Map cAR_INFOR_ID) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Common.selectAll"; // xml의 namespace와 각각 ID의 조합해서 유니크 아이디를 만듬
        
        HashMap result = new HashMap<>();
        
        result.put("resultList", sharedDao.getList(sqlMapId, cAR_INFOR_ID));

        return result;
    }

    public Object selectDetail(String CAR_INFOR_ID) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "Common.selectByUID"; // xml의 namespace와 각각 ID의 조합해서 유니크 아이디를 만듬
        HashMap dataMap = new HashMap<>();
        dataMap.put("CAR_INFOR_ID", CAR_INFOR_ID);

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object insert(Map dataMap) {
        String sqlMapId = "Common.insert";
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Object update(Map dataMap) {
        String sqlMapId = "Common.update";
        
        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

    // MVC view
    public Object delete(Map dataMap) {
        String sqlMapId = "Common.delete";

        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }

    // MVC view
    public Object deleteAndSelectSearch(Map dataMap) {
        HashMap result = new HashMap<>();
        result.put("deleteCount", this.delete(dataMap));

        result.put("resultList", this.selectSearch(dataMap));
        return result;
    }

    public Object insertAndSelectSearch(Map dataMap) {
        HashMap result = new HashMap<>();
        result.put("insertCount", this.insert(dataMap));

        result.put("resultList", this.selectSearch(dataMap));
        return result;
    }

    public Object updateAndSelectSearch(Map dataMap) {
        HashMap result = new HashMap<>();
        result.put("updateCount", this.update(dataMap));

        result.put("resultList", this.selectSearch(dataMap));
        return result;
    }

    // rest api
    public Object delete(String COMMON_CODE_ID) {
        String sqlMapId = "Common.delete";
        HashMap dataMap = new HashMap<>();
        dataMap.put("COMMON_CODE_ID", COMMON_CODE_ID);

        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }

    // 2PC
    public Object insertDouble(Map dataMap) {
        String sqlMapId = "Common.insert";
        // sucess
        Object result = sharedDao.insert(sqlMapId, dataMap);
        // error
        result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

	public Object selectAll_Com(String cOMMON_CODE_ID) {
		return null;
	}
}

