<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.HashMap, java.util.ArrayList" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>관리자 권한</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                crossorigin="anonymous" />
            <link rel="stylesheet" href="/CSS/AdminPage.css">
            <link rel="stylesheet" href="/CSS/mainmenu.css">

        </head>

        <body class="bg-light">
            <!-- 상단 네비게이션 바 -->
            <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>

                <div class="container-fluid">
                    <!-- 관리자 페이지 content -->
                    <div class="row g-20 vh-50">
                       <!-- 관리자 전용 메뉴 -->
                       <%@ include file="\WEB-INF\views\Fitness\Admin\Admin_menu.jsp"%>
                        <div class="text-center container col-10 mt-5 admin-content">
                            <h1 style="text-align: center; margin-top: 1cm; margin-bottom: 1cm;"><strong>관리자
                                    관리</strong></h1>
                            <div class="justify-content-between row p-5 m-3 h6 text-start">
                                <div class="col">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th style="width: 20%;">관리자 권한 부여ID</t>
                                                <th style="width: 20%;">설정</t>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <form action="/admininsert" method="post">
                                                <tr>
                                                    <td>
                                                        <input type="text" name="ID">
                                                    </td>
                                                    <input type="hidden" name="UNIQUE_ID" value="ROLE_ADMIN">
                                                    <td>
                                                        <button type="submit" class="btn btn-primary">확인</button>
                                                    </td>
                                                </tr>
                                            </form>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Footer -->
                <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        </body>

        </html>