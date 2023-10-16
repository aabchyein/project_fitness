<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page import = "com.the_glory.project_fitness.UniqueID.UniqueID" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>관리자 게시판</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                crossorigin="anonymous" />
            <link rel="stylesheet" href="/CSS/AdminPage.css">
            <link rel="stylesheet" href="/CSS/mainmenu.css">
        </head>

        <body>
            <!-- 상단 네비게이션 바 -->
            <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>

                <div class="container-fluid">
                    <!-- 관리자 페이지 content -->
                    <div class="row g-20 vh-50">
                        <!-- 관리자 전용 메뉴 -->
                        <%@ include file="\WEB-INF\views\Fitness\Admin\Admin_menu.jsp"%>

                       
                        <!-- 게시판 답변 등록 폼 -->
                        <div class="col-9 mt-5 admin-content">
                            <h1 class="admin-header text-center">게시판 답변 등록</h1>
                            <div class="container">
                                <% HashMap record=(HashMap)request.getAttribute("record"); %>
                                <% HashMap result=(HashMap)request.getAttribute("params"); %>
                                
                             
                                        <div class="mb-3">
                                            <label for="name" class="form-label">작성자</label>
                                            <input type="text" class="form-control" value='<%= record.get("ID") %>'  readonly>
                                        </div>

                                        <div class="mb-3">
                                            <label for="question" class="form-label">질문 내용</label>
                                            <input type="text" class="form-control" value='<%= record.get("CONTENTS") %>' readonly>
                                        </div>
                                        
                                        <%       
                                        UniqueID uniqueid = new UniqueID();
                                        String uuid = uniqueid.generatUuid();
                                        %>
                                    <form id="answer-form">

                                        <div class="mb-3">
                                            <label for="answer" class="form-label">답변 내용</label>
                                            <input type="text" class="form-control" id="answer" name="ANSWER"
                                                placeholder="답변 내용을 입력하세요">
                                        </div>
                                        
                                        <div>
                                            <input type="hidden" name="ADMIN_ID" value='<%= result.get("ADMIN_ID") %>'>
                                        </div>
                                        <div>
                                            <input type="hidden" name="BOARD_ANSWER_ID" value="<%= uuid %>">
                                        </div>
                                        <div>
                                            <input type="hidden" name="BOARD_ID" value='<%= result.get("BOARD_ID") %>'>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary" formaction="/fitness/insertAndSelectSearch"formmethod="get">등록</button>
                                        </div>
                                    </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- footer -->
                <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>


                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        </body>

        </html>