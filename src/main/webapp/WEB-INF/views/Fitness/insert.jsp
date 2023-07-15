<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="post">
        <!-- <div>CAR_NAME</div>    
        <input type="text" name="CAR_NAME">
        <div>YEAR</div>
        <input type="text" name="YEAR">
        <div>CAR_INFOR_ID</div>
        <input type="text" name="CAR_INFOR_ID" placeholder="미입력시 UUID 값 등록">
        <div>COMPANY_ID</div>
        <input type="text" name="COMPANY_ID"> -->
        <div>이름</div>
        <input type="text" name="CAR_NAME">
        <div>년도</div>    
        <input type="text" name="YEAR">
        <div>자동차 ID</div>
        <input type="text" name="CAR_INFOR_ID">
        <div>회사 ID</div>
        <input type="text" name="COMPANY_ID">
        <div>
            <button type="submit" formaction="/carInfor/insertAndSelectSearch" formmethod="post">제출</button>
        </div>
    </form>
</body>
</html>
