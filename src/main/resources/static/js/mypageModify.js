function showConfirmation() {
    // Perform any necessary validation or checks before showing the confirmation alert
    const name = document.getElementById("name").value;
    const password = document.getElementById("password").value;
    const passwordcheck = document.getElementById("passwordcheck").value;
    const gender = document.getElementById("gender").value;
    const phone = document.getElementById("phone").value;
    const email = document.getElementById("email").value;
    const address = document.getElementById("address").value;
 

    if (name && password && passwordcheck && gender && phone && email && address) {
      // All fields are filled, show confirmation alert
      alert("정보 변경이 완료되었습니다");
      move();
    } else {
      // Show error message or perform any necessary actions if the fields are not filled
      alert("정보를 입력해주세요");
    }
  }

  function move (){
    window.location.href="./mypage.html";
  }