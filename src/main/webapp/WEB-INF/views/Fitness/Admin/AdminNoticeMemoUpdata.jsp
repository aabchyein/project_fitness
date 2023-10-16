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
             <!-- 관리자 전용 메뉴 -->
             <%@ include file="\WEB-INF\views\Fitness\Admin\Admin_menu.jsp"%>

              <div class="container mt-5 col-10 p-5">
                <div class="text-center">
                  <h1>공지사항</h1>
                </div>
                <form method="post">
                    <div class="form-group mt-4">
                      <label for="author">
                        <h3>관리자 : ${userDetailsBean.memberName} 님</h3>
                      </label>
                      <input type="hidden" class="form-control" name="ID" id="author"
                        value="${userDetailsBean.memberName}">
                    </div>
                    <div class="form-group mt-4">
                      <label for="title">제목:</label>
                      <input type="text" class="form-control" name="NOTICE_TITLE" id="title" placeholder="${params.NOTICE_TITLE}">
                    </div>
                    <div class="form-group mt-4">
                      <label for="content">내용:</label>
                      <textarea class="form-control" name="NOTICE_CONTENTS" id="content" rows="5"
                        >${params.NOTICE_CONTENTS}</textarea>
                    </div>
                    <div>
                      <input type="hidden" name="NOTICE_ID" value="${params.NOTICE_ID}">
                    </div>

                    <div class="d-flex justify-content-end mt-5">
                      <button type="submit" class="btn btn-primary" formaction="/AdminnoticeUpdataSelect"
                        formmethod="post">완료</button>
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