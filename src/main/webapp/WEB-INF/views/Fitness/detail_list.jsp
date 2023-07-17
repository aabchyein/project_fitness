<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.the_glory.project_fitness.utils.Paginations" %>

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
    <mapper namespace="CarInfors">
        <div class="row" style="margin-bottom:20px; margin-left:1px;">
            <div class="col-lg-12">
                <h1 class="page-header">상세정보</h1>
            </div>
        </div>
        <%
        HashMap params = (HashMap) request.getAttribute("params");
        String searchStr = (String) params.getOrDefault("search", "");
        HashMap result = (HashMap) request.getAttribute("result");
        %>
        <form>
            <div class="panel" style="margin-left:1px;">
                <div id="contAreaBox">
                    <div class="panel">
                        <div class="panel-body">
                            <div class="table-responsive" style="text-align:center;">
                                <table id="datatable-scroller" class="table table-bordered tbl_Form">
                                    <caption></caption>
                                    <colgroup>
                                        <col width="250px" />
                                        <col />
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="active">차 이름</th>
                                            <td>
                                                <input type="text" name="CAR_NAME" value="<%= result.get("CAR_NAME") %>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="active">년도</th>
                                            <td>
                                                <input type="text" name="YEAR" value="<%= result.get("YEAR") %>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="active">자동차 ID</th>
                                            <td>
                                                <input type="text" name="CAR_INFOR_ID" value="<%= result.get("CAR_INFOR_ID") %>">
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="active">회사 ID</th>
                                            <td>
                                                <input type="text" name="COMPANY_ID" value="<%= result.get("COMPANY_ID") %>">
                                            </td>
                                        </tr>
                                        <div>
                                    </tbody>
                                </table>
                            </div>
                            <div style="margin-left:1px;">
                                <input type="hidden" name="COMMON_CODE_ID" value="<%= request.getParameter("COMMON_CODE_ID") %>">
                                <button type="submit" formaction='/carInfor/updateAndSelectSearch' formmethod="post">전송</button>
                                <button type="submit" formaction='/carInfor/selectSearch' formmethod="get">취소</button>
                            </div>
                        </div>
                    
                    </div>
                </div>
            </div>
        </form>
        
        