<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.the_glory.project_fitness.utils.Paginations" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>관리자 게시판 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <link rel="stylesheet" href="./CSS/AdminPage.css">
    <link rel="stylesheet" href="./CSS/mainmenu.css">
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
                            <a href="/adminPage" class="text-decoration-none nav-link">회원 관리</a>
                        </li>
                        <li class="d-flex align-items-center">
                            <a href="/fitness/AdminBoardAll" class="text-decoration-none nav-link">게시판 관리</a>
                        </li>
                        <li class="d-flex align-items-center">
                            <a href="/Adminnotice" class="text-decoration-none nav-link">공지사항 관리</a>
                        </li>
                        <li class="d-flex align-items-center">
                            <a href="/adminPowerSetting" class="text-decoration-none nav-link">관리자설정</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- 회원관리 데이터 -->
            <div class="col-10 mt-5 admin-content">
                <h1 class="admin-header">예약 관리</h1>
                <form>
                <div class="admin-table">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>이름</th>
                                <th>아이디</th>
                                <th>예약날짜</th>
                                <th>예약시간</th>
                                <th>센터명</th>
                                <th>참고사항</th>
                                <th>확인</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            ArrayList list = (ArrayList) request.getAttribute("result");
                            for(int i=0; i < list.size(); i=i+1) {
                                HashMap record = (HashMap) list.get(i);
                            %>
                            <tr>
                                <td><%= i+1 %></td>
                                <td name="NAME" value='<%= record.get("NAME") %>'><%= record.get("NAME") %></td>
                                <td name="ID" value='<%= record.get("ID") %>'><%= record.get("ID") %></td>
                                <td><input type="text" name="RESERVATION_DATE" value='<%= record.get("RESERVATION_DATE") %>'></td>
                                <td><input type="text" name="RESERVATION_TIME" value='<%= record.get("RESERVATION_TIME") %>'></td>
                                <td><input type="text" name="COMPANY_NAME" value='<%= record.get("COMPANY_NAME") %>'></td>
                                <td name="NOTES" value='<%= record.get("NOTES") %>'><%= record.get("NOTES") %></td>
                                <td class="admin-actions">
                                    <button type="submit" class="btn btn-light" formaction="">수정</button>
                                    <button class="btn btn-danger">삭제</button>
                                </td>
                            </tr>
                            <%
                            }
                            %>
                        </tbody>
                         </table>
                    </form>
                </div>
                <!-- 페이지 넘어가는 표시 -->
                <div class="text-center mt-4">
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- 등록 모달 -->
    <div class="modal fade" id="registrationModal" tabindex="-1" aria-labelledby="registrationModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="registrationModalLabel">게시글 등록</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- 등록 폼 내용 -->
                 
                    <form>
                        <div class="mb-3">
                            <label for="name" class="form-label">작성자</label>
                            <input type="text" class="form-control" id="name" placeholder="작성자를 입력하세요">
                        </div>
                        <div class="mb-3">
                            <label for="date" class="form-label">작성일자</label>
                            <input type="date" class="form-control" id="date">
                        </div>
                        <div class="mb-3">
                            <label for="title" class="form-label">제목</label>
                            <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요">
                        </div>
                        <div class="mb-3">
                            <label for="question" class="form-label">질문 내용</label>
                            <textarea class="form-control" id="question" rows="3" placeholder="질문 내용을 입력하세요"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="answer" class="form-label">답변 내용</label>
                            <textarea class="form-control" id="answer" rows="3" placeholder="답변 내용을 입력하세요"></textarea>
                        </div>
                        
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">등록</button>
                    
                </div>
            </div>
        </div>
    </div>

   <!-- Footer -->
   <footer class="footer container-fluid text-white">
    <div class="row">
      <div class="col-10 justify-content-center">
        <div>
          <div class="footer-content">
            <div class="footer-section links" style="text-align: left;">
              <a href="#">홈 | </a></li>
              <a href="#"> 서비스 |</a></li>
              <a href="#"> 제품 | </a></li>
              <a href="#"> 블로그</a></li>
            </div>
          </div>
        </div>
        <div class="footer-center" style="text-align: left;">
          <p>더글로리Co.| 대표:백구 | 개인정보보호책임자 : 백구 | 사업자등록번호 : 23-202307121</P>
          <p>통신판매신고번호 : 2023-직업학교-0711 | 주소 : 서울시 구로구</p>
        </div>
        <div class="footer-bottom" style="text-align: left;">
          <p>저작권 © 더글로리Co. All rights reserved.</p>
        </div>

      </div>
      <div class="col-2" style="text-align: left;">
        <div id="callcenter">
          <P>고객센터 : 09 ~ 18시</P>
        </div>
        <div id="infors">
          <p>전화번호 : 032-1587-4824</p>
          <P>E-MAIL : theGlroy@glroy.com</P>
        </div>
      </div>
    </div>
  </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>