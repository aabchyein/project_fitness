<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.the_glory.project_fitness.UniqueID.UniqueID" %>


<!DOCTYPE html>
<html>
<head>
  <title>고객게시판</title>
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/CSS/mainmenu.css">
  <link rel="stylesheet" href="/CSS/reviews.css">
  
</head>
<body>
  <!-- 상단 네비게이션 바 -->
  <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>

  <div class="container mt-5">
    <h2>고객게시판</h2>
    <form  method="post">
      <% UniqueID uniqueid = new UniqueID();
      String uuid = uniqueid.generatUuid(); %>
      <input type="hidden" name="NOTICE_ID" value="<%= uuid %>">
      <div class="form-group">
        <label for="title">제목:</label>
        <input type="text" class="form-control" name="NOTICE_TITLE" id="title" placeholder="제목을 입력하세요">
      </div>
      <div class="form-group">
        <label for="author" >작성자:</label>
        <input type="text" class="form-control" name="ID" id="author" placeholder="작성자를 입력하세요" >
      </div>
      <div>
        <input type="hidden" name="NOTICE_DATE">
      </div>
      <div>
        <input type="hidden" name="NOTICE_VIEWS" value="0">
      </div>
      <div class="form-group">
        <label for="content">내용:</label>
        <textarea class="form-control" name="NOTICE_CONTENTS" id="content" rows="5" placeholder="내용을 입력하세요"></textarea>
      </div>
      <div class="d-flex justify-content-between">
          <a href="/Noticelogin" class="btn btn-outline-primary">목록</a>
        <div>
            <button type="submit" class="btn btn-primary" formaction="/guest/memoinsertAndSelectSearch" formmethod="post">등록</button>
            <a href="/Noticelogin" class="btn btn-light">취소</a>
        </div>
      </div>
    </form>
  </div>

  <!-- footer -->
  <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>