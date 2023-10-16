<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
                <a href="/fitness/AdminBoardAll" class="text-decoration-none nav-link">게시판
                    관리</a>
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