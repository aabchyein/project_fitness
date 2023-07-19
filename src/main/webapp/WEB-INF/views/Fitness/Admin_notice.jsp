<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>관리자 게시판 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <link rel="stylesheet" href="/CSS/AdminPage.css">
    <link rel="stylesheet" href="/CSS/mainmenu.css">
</head>

<body>
<!-- 상단 네비게이션 바 -->
<%@ include file="/WEB-INF/views/Fitness/Admin_header.jsp" %>

    <div class="container-fluid">
        <!-- 관리자 페이지 content -->
        <div class="row g-20 vh-50">
            <nav class="p-5 bg-dark navbar-dark d-md-block col-2">
                <div>
                    <ul class="list-unstyled navbar-nav">
                        <li class="d-flex align-items-center">
                            <a href="/AdminPage.html"
                                class="text-decoration-none nav-link fs-5 fw-bold">관리자페이지</a>
                        </li>
                        <li class="d-flex align-items-center">
                            <a href="/AdminPage.html" class="text-decoration-none nav-link">회원 관리</a>
                        </li>
                        <li class="d-flex align-items-center">
                            <a href="/Admin_board.html" class="text-decoration-none nav-link">게시판 관리</a>
                        </li>
                        <li class="d-flex align-items-center">
                            <a href="/Admin_notice.html" class="text-decoration-none nav-link">공지사항 관리</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- 회원관리 데이터 -->
            <div class="col-9 mt-5 admin-content">
                <h1 class="admin-header">공지사항 관리</h1>
                <div class="admin-table">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 9%;">번호</th>
                                <th style="width: 20%;">제목</th>
                                <th style="width: 30%;">내용</th>
                                <th style="width: 15%;">등록일</th>
                                <th style="width: 50%;">확인</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>기구 관련 질문</td>
                                <td>2023-07-01</td>
                                <td>2023-07-01</td>
                                <td class="admin-actions">
                                    <button class="btn btn-secondary" data-bs-toggle="modal"
                                        data-bs-target="#registrationModal">등록</button>
                                    <button class="btn btn-light">수정</button>
                                    <button class="btn btn-danger">삭제</button>
                                </td>
                            </tr>
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

<!-- footer -->
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