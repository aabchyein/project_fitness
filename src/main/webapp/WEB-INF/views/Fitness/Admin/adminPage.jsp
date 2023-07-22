<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>관리자 회원관리 페이지</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                crossorigin="anonymous" />
            <link rel="stylesheet" href="/CSS/AdminPage.css">
            <link rel="stylesheet" href="/CSS/mainmenu.css">

        </head>

        <body class="bg-light">
            <!-- 상단 네비게이션 바 -->
            <%@ include file="/WEB-INF/views/Fitness/Admin_header.jsp" %>

                <div class="container-fluid">
                    <!-- 관리자 페이지 content -->
                    <div class="row g-20 vh-50">
                        <nav class="p-5 bg-dark navbar-dark d-md-block col-2 ">
                            <div>
                                <ul class="list-unstyled navbar-nav">
                                    <li class="d-flex align-items-center">
                                        <a href="#" class="text-decoration-none nav-link fs-5 fw-bold">관리자페이지</a>
                                    </li>
                                    <li class="d-flex align-items-center">
                                        <a href="/AdminPage.html" class="text-decoration-none nav-link">회원 관리</a>
                                    </li>
                                    <li class="d-flex align-items-center">
                                        <a href="/NoticePage.html" class="text-decoration-none nav-link">게시판 관리</a>
                                    </li>
                                    <li class="d-flex align-items-center">
                                        <a href="/NoticePage.html" class="text-decoration-none nav-link">공지사항 관리</a>
                                    </li>
                                </ul>
                            </div>
                        </nav>

                        <!-- 회원관리 데이터  -->
                        <div class="col-9 mt-5 admin-content">
                            <h1 class="admin-header">회원 관리</h1>
                            <div class="admin-table">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th style="width: 9%;">번호</th>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>이메일</th>
                                            <th style="width: 30%;">확인</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        ArrayList List=(ArrayList)request.getAttribute("result");
                                        for(int i=0; i < List.size(); i=i+1) {
                                            HashMap record=(HashMap) List.get(i);
                                        %>
                                        <form>
                                            <input type="hidden" name="ID" value='<%= record.get("ID") %>'>
                                            <input type="hidden" name="BOARD_ANSWER_ID" value='<%= record.get("BOARD_ANSWER_ID") %>'>
                                            <input type="hidden" name="BOARD_ID" value='<%= record.get("BOARD_ID") %>'>
                                            <tr>
                                                <td name="number">
                                                    <%= i+1 %>
                                                </td>
                                                <td name="name">
                                                    <%= record.get("NAME") %>
                                                </td>
                                                <td name="ID">
                                                    <%= record.get("ID") %>
                                                </td>
                                                <td name="address">
                                                    <%= record.get("EMAIL_ADDRESS") %>
                                                </td>
                                                <td class="admin-actions">
                                                    <button class="btn btn-secondary" id="" formaction="/adminPageDetail" formmethod="get">조회</button>
                                                    <button class="btn btn-danger" formaction="/adminPageDelete" formmethod="get">삭제</button>
                                                </td>
                                            </tr>
                                        </form>
                                        <% } %>
                                    </tbody>
                                </table>
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
                <!-- Footer -->
                <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                        crossorigin="anonymous"></script>

                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>