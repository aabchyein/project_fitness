package com.the_glory.project_fitness.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the_glory.project_fitness.dao.SharedDao;
import com.the_glory.project_fitness.utils.Paginations;

@Service
@Transactional
public class CarInforsService {
    @Autowired
    SharedDao sharedDao;

    // foreach HashMap.put("CAR_INFOR_ID_LIST", CAR_INFOR_ID_LIST)
    public Object selectInUID(Map dataMap) {
        String sqlMapId = "CarInfors.selectInUID";

        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    // 검색(조건-search : COMPANY, CAR_NAME)
    // 검색(조건-search : YEAR, CAR_NAME)
    public Object selectSearch(Map dataMap) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "CarInfors.selectSearch";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        // result.put("resultList", this.selectSearch(dataMap));
        HashMap result1 = new HashMap<>();
        result1.putAll(this.selectSearchWithPagination(dataMap));
        return result1;
    }

    // 검색(조건-search : YEAR, CAR_NAME)
    public Object selectSearch(String search, String words) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "CarInfors.selectSearch";
        HashMap dataMap = new HashMap<>();
        dataMap.put("search", search);
        dataMap.put("words", words);

        Object result = sharedDao.getList(sqlMapId, dataMap);

        HashMap result1 = new HashMap<>();
        result1.putAll(this.selectSearchWithPagination(dataMap));
        return result;
    }

    public Object selectAll(String CAR_INFOR_ID) {
        // Object getOne(String sqlMapId, Object dataMap)
        String sqlMapId = "CarInfors.selectAll"; // xml의 namespace와 각각 ID의 조합해서 유니크 아이디를 만듬
        HashMap dataMap = new HashMap<>();
        dataMap.put("CAR_INFOR_ID", CAR_INFOR_ID);

        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object selectDetail(String CAR_INFOR_ID, Map dataMap) {
    // Object getOne(String sqlMapId, Object dataMap)
    String sqlMapId = "CarInfors.selectByUID"; // xml의 namespace와 각각 ID의 조합해서 유니크 아이디를 만듬
    dataMap.put("CAR_INFOR_ID", CAR_INFOR_ID);

    Object result = sharedDao.getOne(sqlMapId, dataMap);
    return result;
    }

    // CAR_INFOR_ID 값에 따른 상세 정보를 가져오는 메소드
    // public Object selectDetail(HashMap map) {
    //     // CarInfors.xml에서 작성한 쿼리 ID를 입력
    //     String sqlMapId = "CarInfors.selectByUID";

    //     // 맵을 이용하여 쿼리에 입력될 CAR_INFOR_ID 값 셋팅
    //     HashMap dataMap = new HashMap<>();
    //     dataMap.put("CAR_INFOR_ID", map);

    //     // DAO를 이용하여 데이터 가져오기
    //     Object result = sharedDao.getOne(sqlMapId, dataMap);

    //     return result;
    // }

    public Object insert(Map dataMap) {
        String sqlMapId = "CarInfors.insert";
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Object update(Map dataMap) {
        String sqlMapId = "CarInfors.update";
        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

    // MVC view
    public Object delete(Map dataMap) {
        String sqlMapId = "CarInfors.delete";

        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }

    // MVC view
    public Object deleteAndSelectSearch(Map dataMap) {
        HashMap result = new HashMap<>();
        // String sqlMapId = "CarInfors.delete";
        // result.put("deleteCount", sharedDao.delete(sqlMapId, dataMap));
        result.put("deleteCount", this.delete(dataMap));

        result.putAll(this.selectSearchWithPagination(dataMap));
        return result;
    }

    public Object insertAndSelectSearch(Map dataMap) {
        HashMap result = new HashMap<>();
        // String sqlMapId = "CarInfors.insert";
        // result.put("deleteCount", sharedDao.delete(sqlMapId, dataMap));
        result.put("insertCount", this.insert(dataMap));

        result.putAll(this.selectSearchWithPagination(dataMap));
        return result;
    }

    public Object updateAndSelectSearch(Map dataMap) {
        HashMap result = new HashMap<>();
        // String sqlMapId = "CarInfors.update";
        // result.put("deleteCount", sharedDao.delete(sqlMapId, dataMap));
        result.put("updateCount", this.update(dataMap));

        result.putAll(this.selectSearchWithPagination(dataMap));
        return result;
    }

    // rest api
    public Object delete(String CAR_INFOR_ID) {
        String sqlMapId = "CarInfors.delete";
        HashMap dataMap = new HashMap<>();
        dataMap.put("CAR_INFOR_ID", CAR_INFOR_ID);

        Object result = sharedDao.delete(sqlMapId, dataMap);
        return result;
    }

    // 검색(조건-search : YEAR, CAR_NAME)
    public Map selectSearchWithPagination(Map dataMap) {
        // 페이지 형성 위한 계산
        int totalCount = (int) this.selectTotal(dataMap);

        int currentPage = 1;
        if (dataMap.get("currentPage") != null) {
            currentPage = Integer.parseInt((String) dataMap.get("currentPage")); // from client in param
        }

        Paginations paginations = new Paginations(totalCount, currentPage);
        HashMap result = new HashMap<>();
        result.put("paginations", paginations); // 페이지에 대한 정보

        // page record 수
        String sqlMapId = "CarInfors.selectSearchWithPagination";
        dataMap.put("pageScale", paginations.getPageScale());
        dataMap.put("pageBegin", paginations.getPageBegin());

        result.put("resultList", sharedDao.getList(sqlMapId, dataMap)); // 표현된 레코드 정보
        return result;
    }

    public Object selectTotal(Map dataMap) {
        String sqlMapId = "CarInfors.selectTotal";

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

}
