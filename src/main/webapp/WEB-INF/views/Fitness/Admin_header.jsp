<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 관리자 상단 네비게이션 바 -->
<nav class="navbar navbar-expand-lg bg-black">
    <div class="container">
        <a class="navbar-brand" href="/adminPage">
            <img src="/Image/로고2.png" alt="로고" height="80">
        </a>
        <!-- 검색창 -->
        <div class="col-lg-4 text-lg-end">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/adminPage">홈</a>
                </li>
               
                <li class="nav-item">
                    <a class="nav-link" href="/adminPage">관리자</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="loginDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">로그아웃</a>
                    <div class="dropdown-menu" aria-labelledby="loginDropdown">
                        <a class="dropdown-item" href="/Logout">로그아웃</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/adminPage">
                        <img src="/Image/house.jpg.png" alt=""
                            style="width: 35px; height: 35px;  margin-top: -0.5em;">
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>