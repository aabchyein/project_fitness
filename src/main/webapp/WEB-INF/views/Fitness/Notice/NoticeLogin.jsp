<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.the_glory.project_fitness.utils.Paginations" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>상담 예약 페이지</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <link rel="stylesheet" href="/CSS/notice.css">
      <link rel="stylesheet" href="/CSS/mainmenu.css">

    </head>

    <body>
      <!-- 상단 네비게이션 바 -->
      <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>


        <!-- 게시판 하단 -->

        <% HashMap params=(HashMap) request.getAttribute("params");
        String searchStr=(String)params.getOrDefault("search", "" );
        HashMap result=(HashMap) request.getAttribute("result");
        %>
          <h1 style="text-align: center; margin-top: 1cm; margin-bottom: 1cm;"><strong>게시판</strong></h1>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-md-6">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <form>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <select class="btn btn-outline-secondary custom-select" type="button" id="search-option" name="search">
                            <option value="choose">선택</option>
                            <option value="NOTICE_TITLE" <%=(searchStr.equals("NOTICE_TITLE")) ? "selected" : "" %>>제목</option>
                            <option value="NOTICE_CONTENTS" <%=(searchStr.equals("NOTICE_CONTENTS")) ? "selected" : "" %>>내용</option>
                            <option value="ID" <%=(searchStr.equals("ID")) ? "selected" : "" %>>작성자</option>
                           </select>
                        </div>
                        <input type="text" class="form-control" name="words" value='<%= params.getOrDefault("words", "") %>' placeholder="검색어를 입력하세요" id="keydownEnter"/>
                        <div class="input-group-append">
                          <button class="btn btn-primary" type="submit" formaction="" formmethod="get" onclick="comOption()">검색</button>
                        </div>
                      </div>
                    </form>
                </div>
              </div>
            </div>
          </div>

          <!-- 테이블 -->
          <div class="text-center container">
            <div class="justify-content-between row p-5 m-3 h6 text-start">
              <div class="col">
                <table class="table">
                  <thead>
                    <tr>
                      <th style="width: 10%;"><strong>번호</strong></th>
                      <th style="width: 40%;"><strong>제목</strong></th>
                      <th style="width: 20%;">작성자</th>
                      <th style="width: 20%;">날짜</th>
                      <th style="width: 20%;">조회수</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% ArrayList resultList=(ArrayList)result.get("resultList"); for(int i=0; i < resultList.size();
                      i=i+1){ HashMap record=(HashMap)resultList.get(i); %>
                      <tr>
                        <td>
                          <%= i+1 %>
                        </td>
                        <td>
                          <a href='/guest/boardmemoDetail/<%= record.get("NOTICE_ID") %>'>
                          <%= record.get("NOTICE_TITLE") %>
                          </a>
                        </td>
                        <td>
                          <%= record.get("ID") %>
                        </td>
                        <td>
                          <%= record.get("NOTICE_DATE") %>
                        </td>
                        <td>
                          <%= record.get("NOTICE_VIEWS") %>
                        </td>
                      </tr>
                      <% } %>
                  </tbody>
                </table>
              </div>
              <!-- 글작성 버튼 -->
              <div class="container text-end">
                <a href="/guest/boardmemo" class="btn btn-secondary">글작성</a>
              </div>
            </div>
          </div>

          <!-- 페이지 넘어가는 표시 -->
          <% Paginations paginations=(Paginations)result.get("paginations"); %>
            <div>총 갯수 : <%= paginations.getTotalCount() %>
                <div class="text-center mt-4">
                  <ul class="pagination justify-content-center">
                    <li class="page-item">
                      <a class="page-link"
                        href='/Noticelogin?currentPage=<%= paginations.getPreviousPage() %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>'>Previous</a>
                      <span aria-hidden="true">&lt;</span>
                      </a>
                    </li>
                    
                    <% for(int i=paginations.getBlockStart();i <=paginations.getBlockEnd(); i=i+1){ %>
                      <li class="page-item">
                        <a class="page-link" href='/Noticelogin?currentPage=<%= i %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>'>
                          <%= i %>
                        </a>
                      </li>
                      <% } %>
                        <li class="page-item">
                          <a class="page-link" href='/Noticelogin?currentPage=<%= paginations.getNextPage() %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>'>Next</a>
                          <span aria-hidden="true">&gt;</span>
                          </a>
                        </li>
                  </ul>
                </div>

                <!-- footer -->
                <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

                  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                  
                  <script>
                    $(document).ready(function() {
                    $('#keydownEnter').on('keydown', function(event) {
                      if (event.keyCode === 13) {  // 엔터키를 누르면
                        event.preventDefault();   // 기본 이벤트 실행 취소
                        $("#keydownEnter").closest('form').submit(); // 가장 가까운 form을 찾아 submit() 실행
                      }
                    });
                  });

                    // $(document).ready(function () {
                    //   $('.dropdown-toggle').dropdown();
                    // });
                 
                    //   let keydownObject = document.querySelector("#keydownEnter");

                    //   keydownObject.addEventListener('keydown', (event) => { // keydown은 내가 하려는 것을 적는것이다 click 도 가능하다.
                    //     if (event.code == 'Enter') { // enter 했을때만 작동하게 만드는 문법
                    //       comOption();
                    //     }
                    //   });

                      function comOption() {
                        // url 입력
                        let url = `http://192.168.0.51:8080/Noticelogin`; // 입력값을 url에 넣는 방법
                        // fetch 사용
                        return fetch(url)
                          .then(response => {
                            return response.json();
                          })
                          .then(data => {
                            // data에 hashmap 파일 저장이 되있으므로 data 사용
                            let outHtml = `<option>Select an option...</option>`;
                            for (let testMap of data) {
                              outHtml += `<option value="${testMap.COLUMN_NAME}">${testMap.COLUMN_NAME} </option>`;
                            }
                            let comOptionElment = document.querySelector('#comoption');
                            comOptionElment.innerHTML = outHtml;
                          })
                          .catch(error => {
                            console.log(error);
                          });
                      }
                    

                  </script>
    </body>

    </html>