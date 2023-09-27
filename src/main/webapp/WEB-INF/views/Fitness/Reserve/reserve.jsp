<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>상담 예약 페이지</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.11.0/dist/css/bootstrap-datepicker.min.css">
  <link rel="stylesheet" href="/CSS/reserve.css">
  <link rel="stylesheet" href="/CSS/mainmenu.css">



<body>
  <sec:authentication property="principal" var="userDetailsBean" />
  <!-- 상단 네비게이션 바 -->
  <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>

  <!-- 상담 예약 -->
  <div class="container p-5">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">상담 예약</h5>
        <form action="/guest/reserveinsert" formmethod="get" id="insertForm">
          <input type="hidden" name="ID" value=${userDetailsBean.username}>
          <div class="form-group m-5">
            <label for="datepicker">날짜 선택:</label>
            <input class="datepicker my-custom-calendar" type="date" name="RESERVATION_DATE" id="datepicker">

          </div>
          <div id="custom-calendar"></div>
          <div class="form-group m-5">
            <label for="timepicker">시간 선택:</label>
            <select class="form-control" id="timepicker" name="RESERVATION_TIME" required>
              <option>원하는 시간대를 선택하세요</option>
              <option>10:00 - 11:00</option>
              <option>11:00 - 12:00</option>
              <option>12:00 - 13:00</option>
              <option>13:00 - 14:00</option>
              <option>14:00 - 15:00</option>
              <option>15:00 - 16:00</option>
              <option>16:00 - 17:00</option>
              <option>17:00 - 18:00</option>
              <option>18:00 - 19:00</option>
              <option>19:00 - 20:00</option>
              <option>20:00 - 21:00</option>
            </select>
          </div>
          <div class="form-group m-5">
            <%
            HashMap record = (HashMap) request.getAttribute("params");
            %> 
            <label for="COMPANY_NAME">센터명 :  <%= record.get("COMPANY_NAME") %></label>
            <input type="hidden" class="form-control" name="COMPANY_ID" value='<%= record.get("COMPANY_ID") %>'></input>
          </div>
          <div class="form-group m-5">
            <label for="editor">상담 시 참고할 부분을 적어주세요. (병력 및 신체 이상, 원하시는 점이나 기대하는 점)
            </label>
            <div class="form-control"  id="editor" rows="2" style="height: 150px;" required=""></div>
            <input type="hidden" name="NOTES" id="contentInput" />
          </div>
          <div class="row">
            <div class="col-md-12 text-center">
              <a href="/main" class="btn btn-secondary">취소</a>
              <button type="submit" class="btn btn-primary" >완료</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

  <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

    <script>
      // $(function () {
      //   $("#datepicker").datepicker({
      //     minDate: 0 // 오늘 이전 날짜 선택 불가
      //   });
      // });

      // function gymloginconnect() {
      //   window.location.href = "/Gym_Login";
      // }
      // function gymloginNoconnect() {
      //   window.location.href = "/reserve";
      // }
      
      // $(function showConfirmation() {
      //   // Perform any necessary validation or checks before showing the confirmation alert
      //   const date = document.getElementById("datepicker").value;
      //   const time = document.getElementById("timepicker").value;
      //   const centerName = document.getElementById("centerName").value;
      //   const notes = document.getElementById("notes").value;

      //   if (date && time && centerName && notes) {
      //     // All fields are filled, show confirmation alert
      //     alert("예약이 완료되었습니다!");
      //     gymloginconnect();
      //   } else {
      //     // Show error message or perform any necessary actions if the fields are not filled
      //     alert("내용이 입력되지 않았습니다.");
      //     gymloginNoconnect();
      //   }
      // });
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    <script>
        var quill = new Quill('#editor', {
            theme: 'snow'
        });

        quill.setContents(${content}); // jsp 문법을 해석하는 와중에 생기는 오류임.

        // Set hidden input value before form submission
        let form = document.querySelector('#insertForm');
        form.onsubmit = function () {
            var contentInput = document.querySelector('#contentInput');
            contentInput.value = quill.root.innerHTML;
            return true;
        };
    </script>

</body>

</html>