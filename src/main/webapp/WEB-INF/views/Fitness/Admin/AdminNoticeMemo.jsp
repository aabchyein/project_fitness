<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.util.HashMap, java.util.ArrayList, com.the_glory.project_fitness.UniqueID.UniqueID" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
      <sec:authentication property="principal" var="userDetailsBean" />


      <!DOCTYPE html>
      <html>

      <head>
        <title>공지사항</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="/CSS/mainmenu.css">
        <link rel="stylesheet" href="/CSS/reviews.css">

      </head>

      <body>
        <!-- 상단 네비게이션 바 -->
        <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>
          <div class="container-fluid">
            <!-- 관리자 페이지 content -->
            <div class="row g-20 vh-50">
              <nav class="p-5 bg-dark navbar-dark d-md-block col-2 ">
                <div>
                  <ul class="list-unstyled navbar-nav">
                    <li class="d-flex align-items-center">
                      <a href="/" class="text-decoration-none nav-link fs-5 fw-bold">관리자페이지</a>
                    </li>
                    <li class="d-flex align-items-center">
                      <a href="/charts/google_charts_scatter" class="text-decoration-none nav-link">차트 관리</a>
                  </li>
                    <li class="d-flex align-items-center">
                      <a href="/adminPage" class="text-decoration-none nav-link">회원 관리</a>
                    </li>
                    <li class="d-flex align-items-center">
                      <a href="/adminReserve" class="text-decoration-none nav-link">예약 관리</a>
                    </li>
                    <li class="d-flex align-items-center">
                      <a href="/fitness/AdminBoardAll" class="text-decoration-none nav-link">게시판
                        관리</a>
                    </li>
                    <li class="d-flex align-items-center">
                      <a href="/Adminnotice" class="text-decoration-none nav-link">공지사항 관리</a>
                    </li>
                    <li class="d-flex align-items-center">
                      <a href="/adminPowerSetting" class="text-decoration-none nav-link">관리자 설정</a>
                    </li>
                  </ul>
                </div>
              </nav>

              <div class="container mt-5 col-10 p-5">
                <div class="text-center">
                  <h1>공지사항</h1>
                </div>
                <form method="post">
                  <% UniqueID uniqueid=new UniqueID(); String uuid=uniqueid.generatUuid(); %>
                    <input type="hidden" name="NOTICE_ID" value="<%= uuid %>">
                    <div class="form-group mt-4">
                      <label for="author">
                        <h3>관리자 : ${userDetailsBean.memberName} 님</h3>
                      </label>
                      <input type="hidden" class="form-control" name="ID" id="author"
                        value="${userDetailsBean.memberName}">
                    </div>
                    <div>
                      <input type="hidden" name="NOTICE_DATE">
                    </div>
                    <div class="form-group mt-4">
                      <label for="title">제목:</label>
                      <input type="text" class="form-control" name="NOTICE_TITLE" id="title" placeholder="제목을 입력하세요">
                    </div>
                    <div>
                      <input type="hidden" name="NOTICE_VIEWS" value="0">
                    </div>
                    <div class="form-group mt-4">
                      <label for="content">내용:</label>
                      <textarea class="form-control" name="NOTICE_CONTENTS" id="content" rows="5"
                        placeholder="내용을 입력하세요"></textarea>
                    </div>

                    <div class="d-flex justify-content-end mt-5">
                      <button type="submit" class="btn btn-primary" formaction="/guest/memoinsertAndSelectSearch"
                        formmethod="post">등록</button>
                      <a href="/Adminnotice" class="btn btn-light">취소</a>
                    </div>

                </form>
              </div>
            </div>
          </div>

          <!-- footer -->
          <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
      </body>

      </html>