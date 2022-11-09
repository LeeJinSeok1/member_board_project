<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-09
  Time: 오전 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container mt-5">

  <form action="/memberUpdate" method="post" class="form-control" name="up_form">
    <input type="text" name="id" value="${member.id}" hidden>

    <input type="text" name="memberEmail"  class="form-control" value="${member.memberEmail}" readonly > <br>

    <br>
    <input type="text" name="memberPass" id="pass" class="form-control"  placeholder="비밀번호입력" > <br>

    <br>
    <input type="text" name="memberName"  class="form-control" value="${member.memberName}" placeholder="성함입력" > <br>

    <br>
    <button onclick="ckPass()" class="btn btn-warning">수정하기</button>

  </form>

</div>
<script>
  const ckPass = () => {
    const pass = document.getElementById("pass").value;
    const memberPass= ${member.memberPass};
    if(pass != memberPass) {
      alert("비밀번호가 틀립니다.")
    }else if(pass == memberPass){
      document.up_form.submit();
    }
  }
</script>

</body>
</html>
