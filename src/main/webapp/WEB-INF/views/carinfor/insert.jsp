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
        <div>COMMON_CODE_ID</div>    
        <input type="text" name="COMMON_CODE_ID">
        <div>NAME</div>
        <input type="text" name="NAME">
        <div>ORDER_NUMBER</div>
        <input type="text" name="ORDER_NUMBER" placeholder="미입력시 UUID 값 등록">
        <div>DESCRIPTION</div>
        <input type="text" name="DESCRIPTION">
        <div>SYSTEM_CODE_YN</div>
        <input type="text" name="SYSTEM_CODE_YN" placeholder="미입력시 UUID 값 등록">
        <div>USE_YN</div>
        <input type="text" name="USE_YN">
        <div>PARENT_COMMON_CODE_ID</div>    
        <input type="text" name="PARENT_COMMON_CODE_ID">
        <div>REGISTER_SEQ</div>
        <input type="text" name="REGISTER_SEQ">
        <div>MODIFIER_SEQ</div>
        <input type="text" name="MODIFIER_SEQ">
        <div>
            <button type="submit" formaction="/common/InsertAndSelectSearch" formmethod="post">제출</button>
        </div>
    </form>
</body>
</html>
