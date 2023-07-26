<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <!-- 메뉴 navbar -->
    <sec:authentication property="principal" var="userDetailsBean" />
    <form action="">
      <nav class="navbar navbar-expand-lg bg-black">
        <div class="container">
          <a class="navbar-brand" href="/main">
            <img src="/Image/로고2.png" alt="로고" height="120">
          </a>
          <!-- 검색창 -->
          <form class="d-flex col-lg-4">
            <select class="btn btn-light custom-select" type="button" name="search" id="search-option">
              <option value="COMPANY_NAME">업체명</option>
              <option value="ADDRESS">주소</option>
              <option value="ROAD_ADDRESS">도로명 주소</option>
            </select>
            <input class="form-control search-input me-2" type="text" name="words" value="" placeholder="업체명이나 지역을 입력하세요"
              aria-label="Search">
            <button id="search" class="btn" style="background-color: #8B0000; color: white;" type="submit" formaction="/Search" formmethod="get"
              >검색</button>   
          </form>
          <div class="col-lg-6 text-lg-end">
            <ul class="navbar-nav ms-auto">
              <sec:authorize access=" hasRole('ROLE_ADMIN')" >
                <li class="nav-item">
                  <a class="nav-link" href="/adminPage">
                    <img src="/Image/house.jpg.png" alt="" style="width: 35px; height: 35px;  margin-top: -0.5em;">
                  </a>
                </li>
                </sec:authorize>
              <li class="nav-item">
                <a class="nav-link" href="/main">홈</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="communityDropdown" role="button" data-toggle="dropdown"
                  aria-haspopup="true" aria-expanded="false">커뮤니티</a>
                <div class="dropdown-menu" aria-labelledby="communityDropdown">
                  <a class="dropdown-item" href="/Noticelogin">게시판</a>
                  <a class="dropdown-item" href="/Review">후기</a>
                </div>
              </li>
              <sec:authorize access="isAnonymous()">
                <li class="nav-item">
                  <a class="nav-link" href="/Login2">로그인</a>
                </li>

                <li class="nav-item">
                  <a class="nav-link" href="/Join">회원가입</a>

                </li>
              </sec:authorize>
              <sec:authorize access="isAuthenticated()">
                <li class="nav-link">
                 환영합니다. ${userDetailsBean.memberName} 님
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="" id="loginDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">로그아웃</a>
                  <div class="dropdown-menu" aria-labelledby="loginDropdown">
                    <a class="dropdown-item" href="/Logout">로그아웃</a>
                    <a class="dropdown-item" href="/mypage?ID=${userDetailsBean.username}">마이페이지</a>
              </sec:authorize>
           
            </ul>
          </div>
        </div>
      </nav>
    </form>