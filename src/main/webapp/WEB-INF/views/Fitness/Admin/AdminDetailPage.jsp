<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.HashMap, java.util.ArrayList" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>관리자 회원관리</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                crossorigin="anonymous" />
            <link rel="stylesheet" href="./CSS/AdminPage.css">
            <link rel="stylesheet" href="./CSS/mainmenu.css">

        </head>

        <body class="bg-light">
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
                                        <a href="/fitness/AdminBoardAll" class="text-decoration-none nav-link">게시판 관리</a>
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

                        <!-- 회원관리 데이터  -->
                            <div class="col-9 mt-5 admin-content">
                                <h1 class="admin-header">회원 관리</h1>
                                <div class="admin-table">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>이름</th>
                                                <th>성별</th>
                                                <th>아이디</th>
                                                <th>이메일</th>
                                                <th>휴대폰번호</th>
                                                <th>주소</th>
                                                <th>확인</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% HashMap record=(HashMap) request.getAttribute("result1"); %>
                                            <form>
                                                <tr>
                                                    <td>
                                                        <%= record.get("NAME") %>
                                                    </td>
                                                    <td>
                                                        <%= record.get("GENDER") %>
                                                    </td>
                                                    <td>
                                                        <%= record.get("ID") %>
                                                    </td>
                                                    <td>
                                                        <%= record.get("EMAIL_ADDRESS") %>
                                                    </td>
                                                    <td>
                                                        <%= record.get("PHONE_NUMBER") %>
                                                    </td>
                                                    <td>
                                                        <%= record.get("ADDRESS") %>
                                                    </td>
                                                    <td class="admin-actions">
                                                        <button class="btn btn-outline-dark" formaction="/adminPage" formmethod="get">확인</button>
                                                    </td>
                                                </tr>
                                            </form>
                                        </tbody>
                                    </table>
                                </div>
                            </div>


                        <!-- Footer -->
                        <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        </body>

        </html>