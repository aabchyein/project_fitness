<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>고객게시판</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="./CSS/mainmenu.css">
  <link rel="stylesheet" href="./CSS/reviews.css">
  
</head>
<body>
  <!-- 상단 네비게이션 바 -->
  <%@ include file="/WEB-INF/views/Fitness/LoginHeader.jsp" %>

  <div class="container mt-5">
    <h2>고객게시판</h2>
    <form>
      <div class="form-group">
        <label for="title">제목:</label>
        <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요">
      </div>
      <div class="form-group">
        <label for="author">작성자:</label>
        <input type="text" class="form-control" id="author" placeholder="작성자를 입력하세요">
      </div>
      <div class="form-group">
        <label for="email">이메일:</label>
        <div class="input-group">
          <input type="text" class="form-control" id="email" placeholder="이메일을 입력하세요">
          <div class="input-group-append">
            <select class="form-control">
              <option value="naver.com">naver.com</option>
              <option value="daum.net">daum.net</option>
              <option value="nate.com">nate.com</option>
              <option value="hotmail.com">hotmail.com</option>
              <option value="gmail.com">gmail.com</option>
              <option value="직접입력">직접입력</option>
            </select>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label for="content">내용:</label>
        <textarea class="form-control" id="content" rows="5" placeholder="내용을 입력하세요"></textarea>
      </div>
      <div class="d-flex justify-content-between">
          <a href="noticelogin" class="btn btn-outline-primary">목록</a>
        <div>
            <a href="./notice_login.html" class="btn btn-primary">등록</a>
            <a href="noticelogin" class="btn btn-light">취소</a>
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