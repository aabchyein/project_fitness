<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.the_glory.project_fitness.utils.Paginations" %>

  <!-- 메뉴 navbar -->
  <nav class="navbar navbar-expand-lg bg-black">
    <div class="container">
      <a class="navbar-brand" href="/">
        <img src="/Image/로고2.png" alt="로고" height="90">
      </a>
      <!-- 검색창 -->
      <form class="d-flex col-lg-5">
        <select name="search" id="">
          <option value="COMPANY_NAME">업체명</option>
          <option value="ADDRESS">주소</option>
          <option value="ROAD_ADDRESS">도로명 주소</option>
        </select>
        <input class="form-control search-input me-2" type="text" name="words" value="" placeholder="업체명이나 지역을 입력하세요"
          aria-label="Search">
        <button id="search" class="btn" style="background-color: #8B0000; color: white;" type="submit" formaction="/Search" formmethod="get"
          >검색</button>   

      </form>
      <div class="col-lg-4 text-lg-end">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="/">홈</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="/Login2">예약</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="communityDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">커뮤니티</a>
            <div class="dropdown-menu" aria-labelledby="communityDropdown">
              <a class="dropdown-item" href="/notice/Notice">게시판</a>
              <a class="dropdown-item" href="/Review">후기</a>
            </div>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="/Login2">로그인</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="/Join">회원가입</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="/">
              <img src="/Image/house.jpg.png" alt="" style="width: 35px; height: 35px;  margin-top: -0.5em;">
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>