<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html>

    <head>
        <title>로그아웃</title>
        <!-- 부트스트랩 링크 추가 -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>

    <body>
        <!-- 로그아웃 확인 모달 -->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="logoutModalLabel">로그아웃 확인</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        로그아웃을 진행하시겠습니까?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        <form action="/logout" method="post">
                            <button type="submit" class="btn btn-secondary">로그아웃</button>
                            <!-- 로그아웃 요청을 처리하는 URL로 수정해야 함 -->
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- 부트스트랩 스크립트 추가 -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script>
            // 페이지 로드 시 로그아웃 확인 모달 표시
            window.addEventListener('load', function () {
                $('#logoutModal').modal('show');
            });

            // 취소 버튼 클릭 시 gym.html로 이동
            document.querySelector('#logoutModal .modal-footer .btn-secondary').addEventListener('click', function () {
                window.location.href = "./gym_login.html";
            });
        </script>
    </body>

    </html>