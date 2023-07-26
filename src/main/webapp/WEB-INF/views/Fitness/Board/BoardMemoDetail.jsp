<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>


<!DOCTYPE html>
<html>
<head>
  <title>고객게시판</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/CSS/mainmenu.css">
  <link rel="stylesheet" href="/CSS/reviews.css">
  
</head>
<body>
  <!-- 상단 네비게이션 바 -->
  <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>

  <div class="container mt-5">
    <h2>고객게시판</h2>
    <%
  HashMap record = (HashMap) request.getAttribute("record");
  if (record == null) {
    record = new HashMap(); // Create an empty HashMap to prevent NullPointerException
  }
%>
      <div class="form-group">
        <label for="title">제목:</label>
        <input type="text" class="form-control" name="NOTICE_TITLE" value='<%= record.get("NOTICE_TITLE") %>' id="title" readonly>
      </div>
      <div class="form-group">
        <label for="author" >작성자:</label>
        <input type="text" class="form-control" name="ID" value='<%= record.get("ID") %>' id="author" readonly >
      </div>
      <div>
        <input type="hidden" name="NOTICE_DATE">
      </div>
      <div>
        <input type="hidden" name="NOTICE_VIEWS" value="0">
      </div>
      <div class="form-group">
        <label for="content">내용:</label>
        <textarea class="form-control" name="NOTICE_CONTENTS"  id="content" rows="5" readonly><%= record.get("NOTICE_CONTENTS") %></textarea>
      </div>
      <div class="d-flex justify-content-between">
          <a href="/Noticelogin" class="btn btn-outline-primary">목록</a>
      </div>
  </div>

  <!-- footer -->
  <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>