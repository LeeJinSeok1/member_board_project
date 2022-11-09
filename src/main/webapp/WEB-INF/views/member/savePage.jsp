<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-04
  Time: 오전 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>savePage.jsp</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
  <script src="/resources/js/jqurey.js"></script>

</head>
<body>
<div class="container mt-5">

<form action="/saveMember" method="post" class="form-control">

  <input type="text" name="memberEmail" onblur="emailFun()" class="form-control" placeholder="이메일입력" id="emailId"> <br>
  <div id="emailBox"></div>
  <br>
  <input type="text" name="memberPass" onblur="passFun()" class="form-control" placeholder="비밀번호입력" id="passId"> <br>
  <div id="passBox"></div>
  <br>
  <input type="text" name="memberName" onblur="nameFun()" class="form-control" placeholder="성함입력" id="nameId"> <br>
  <div id="nameBox"></div>
  <br>
  <input type="submit" name="회원가입" class="btn-success"> <br>

</form>

</div>
</body>
<script>
  const emailFun = () => {
     const ckEmail =  document.getElementById("emailId").value;
    const emailBox = document.getElementById("emailBox")
    $.ajax({
      type:"get",
      url:"/emailCk",
      data:{
       memberEmail:ckEmail
      },
      dateType: "text",
      success: function (ck) {
        console.log(ck)
       if(ck=="no") {
         emailBox.innerHTML = "중복된 이메일입니다.!"
         emailBox.style.color = "red";
       }else if(ck=="good"){
         emailBox.innerHTML= "사용 가능한 이메일입니다.!"
         emailBox.style.color="green";
       }
      },
      error: function (ck) {
        console.log(ck)
        console.log("실패")
      }
    })

  }

  const passFun = () => {
    const ckPass = document.getElementById("passId").value;
    const passBox = document.getElementById("passBox");
    if(ckPass==""){
      passBox.innerHTML="비밀번호를 입력해주세요!"
      passBox.style.color="red";
    }else{
      passBox.innerHTML="안전한 비밀번호네요!"
      passBox.style.color="green";
    }

  }
  const nameFun= () => {
    const ckName = document.getElementById("nameId").value;
    const nameBox = document.getElementById("nameBox");
    if(ckName==""){
      nameBox.innerHTML="필수 정보입니다."
      nameBox.style.color="red";
    }else {
      nameBox.innerHTML="멋진 성함이네요!"
      nameBox.style.color="green";
    }

  }


</script>
</html>
