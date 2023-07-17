<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="./gym.html">
            <img src="/Image/로고2.png" alt="로고" height="80">
        </a>
        <!-- 검색창 -->
        <div class="col-lg-4 text-lg-end">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="./gym.html">홈</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./reserve.html">예약</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="communityDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
                    <div class="dropdown-menu" aria-labelledby="communityDropdown">
                        <a class="dropdown-item" href="./notice.html">게시판</a>
                        <a class="dropdown-item" href="./Review.html">후기</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="loginDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">로그아웃</a>
                    <div class="dropdown-menu" aria-labelledby="loginDropdown">
                        <a class="dropdown-item" href="./Logout.html">로그아웃</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>