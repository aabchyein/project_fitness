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
                       <!-- 관리자 전용 메뉴 -->
                       <%@ include file="\WEB-INF\views\Fitness\Admin\Admin_menu.jsp"%>

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