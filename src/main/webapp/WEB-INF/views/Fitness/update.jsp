<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Bootstrap 5 Template</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
        </head>
        
        <body>
            <form>
              <h2>update page</h2>
              <div>NAME</div>
              <input type="text" name="NAME">
              <div>ORDER_NUMBER</div>
              <input type="text" name="ORDER_NUMBER" placeholder="미입력시 UUID 값 등록">
              <div>DESCRIPTION</div>
              <input type="text" name="DESCRIPTION">
              <div>USE_YN</div>
              <input type="text" name="USE_YN">
              <div>REGISTER_SEQ</div>
              <input type="text" name="REGISTER_SEQ">
              <div>MODIFIER_SEQ</div>
              <input type="text" name="MODIFIER_SEQ">
              <button type="submit" formaction='/Fitness/updateAndSelectSearch' formmethod="post">전송</button>
            </form>
        </body>

        </html>

