<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
   
  <sec:authentication property="principal" var="userDetailsBean" />

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
      <link rel="stylesheet" href="./CSS/mainmenu.css">
      <link rel="stylesheet" href="./CSS/reviews.css">
      <title>리뷰 작성</title>
    </head>

    <body>
      <!-- 상단 네비게이션 바 -->
      <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>

        <!-- 리뷰 작성 -->
        <div class="container p-5">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title text-center">Review 작성</h5>
              <form id="reviewForm">
                <div class="form-group">
                  <label for="id">
                    <h4>작성자</h4>
                  </label>
                  <input class="form-control" type="text" name="ID" id="id" value="${userDetailsBean.memberName}"
                    required>
                </div>
                <div class="form-group">
                  <label for="facility">시설명</label>
                  <input class="form-control" type="text" name="COMPANY_NAME" id="facility">
                  <button type="submit" method="GET" onclick="searchclick();">검색</button>
                </div>
                <div id="facilityDropdown" style="display: none;">
                  <ui id="facilityList"></ui>
                </div>
                <div class="form-group">
                  <label for="content">내용</label>
                  <textarea class="form-control" id="content" rows="5"></textarea>
                </div>
                <div class="form-group">
                  <label for="rating">별점</label>
                  <div class="rating-dropdown">
                    <select id="rating">
                      <option value="" disabled selected hidden>별점을 선택하세요</option>
                      <option value="5">★★★★★</option>
                      <option value="4">★★★★</option>
                      <option value="3">★★★</option>
                      <option value="2">★★</option>
                      <option value="1">★</option>
                    </select>
                    <div class="stars">
                      <label for="rating5"></label>
                      <label for="rating4"></label>
                      <label for="rating3"></label>
                      <label for="rating2"></label>
                      <label for="rating1"></label>
                    </div>
                  </div>
                </div>


                <div class="row">
                  <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-primary" onclick="move();">작성 완료</button>
                  </div>
                </div>

              </form>
            </div>
          </div>
        </div>

        <!-- Footer -->
        <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>


          <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </body>
    <script>
      const ratingDropdown = document.querySelector('.rating-dropdown');
      const ratingSelect = ratingDropdown.querySelector('select');
      const ratingStars = ratingDropdown.querySelectorAll('label');

      ratingStars.forEach((star, index) => {
        star.addEventListener('click', () => {
          ratingSelect.value = index + 1;
          ratingStars.forEach((s, i) => {
            s.classList.remove('active');
            if (i <= index) {
              s.classList.add('active');
              move();
            }
          });
        });
      });

      function move() {
        window.location.href = "/Review"
      }
    </script>
   <script>
    function searchclick() {
      // 사용자가 입력한 시설명 가져오기
      const facilityName = encodeURIComponent(document.getElementById('facility').value);
      
      // 데이터를 서버로 전송할 URL 정의
      const url = `/ReviewCompanyName?COMPANY_NAME=${facilityName}`; // 쿼리 문자열로 데이터를 추가
  
      // GET 요청 보내기
      fetch(url)
        .then(response => {
          if (response.ok) {
            // 서버 응답이 성공적인 경우 여기에서 처리
            return response.json(); // JSON 형식으로 응답 데이터를 파싱
          } else {
            // 서버 응답이 실패한 경우 여기에서 처리
            console.error('서버 응답이 실패했습니다.');
            throw new Error('서버 응답이 실패했습니다.');
          }
        })
        .then(data => {
          // 응답 데이터를 처리하여 화면에 표시
          const facilityList = document.getElementById('facilityList');
          facilityList.innerHTML = ''; // 리스트 초기화
  
          // 데이터를 리스트에 추가
          for (const item of data) {
            const listItem = document.createElement('li');
            listItem.textContent = item.COMPANY_NAME;
            facilityList.appendChild(listItem);
          }
  
          // 결과 표시
          document.getElementById('facilityDropdown').style.display = 'block';
        })
        .catch(error => {
          // 네트워크 오류 등의 문제가 발생한 경우 여기에서 처리
          console.error('오류 발생:', error);
        });
    }
  </script>



    <!-- <script>
      var facilityInput = document.getElementById("facility");
      var facilityList = document.getElementById("facilityList");

      // 서버에서 시설명 데이터를 가져와 동적으로 드롭다운 목록을 채웁니다.
      let keydownObject = document.querySelector("#facility");
      // 키보드의 Enter를 입력하면 값을 event에 담김(keydow, click 등 명령어로 event 발생조건 설정가능)
      keydownObject.addEventListener('keydown', (event) => {
        if (event.code == 'Enter') {
          console.log(`key down : ${event.code}`);
          searchclick();
        }
      });
      function searchclick() {
        let getinputObject = document.querySelector('#facility');
        let inputValue = getinputObject.value;
        let url = `/ReviewCompanyName`;
        let request = fetch(url, inputValue)
          .then((result) => {
            return result.json();
          })
          .then((data) => {
            console.log(data);
            companylist(data);
          })
          .catch((errorMeg) => { //fetch로 받은 문자열의 문제가 생겼을때 catch 해당 에러를 받아내다.
            console.log(errorMeg);
          });
      }

      function companylist(data) {
        const company_obj = data;

        let outHtml = `<div>`;
        for (let company_hashmap of company_obj) {
          console.log(`COMPANY_NAME: ${company_hashmap.COMPANY_NAME}`);
          outHtml += `<ui>${company_hashmap.COMPANY_NAME}</ui>`;
        }
        outHtml += `</div>`;
        let listSource = document.querySelector(`#facilityList`);
        listSource.innerHTML = outHtml

      }
    </script> -->

    </html>