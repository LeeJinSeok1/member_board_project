<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-08
  Time: 오전 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>loginPage.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <style>
        #lgBox {
            width: 1000px;
            margin-top: 50px;
        }

    </style>
</head>
<body>
<div class="container mt-5" >
    <form action="/login" method="get" class="form-control" id="lgBox">
        <input type="text" name="memberEmail" class="form-control mt-5" placeholder="이메일 입력"> <br>
        <input type="text" name="memberPass" class="form-control" placeholder="비밀번호 입력"> <br>
        <input type="submit" class="btn btn-primary" value="로그인하기">
    </form>
</div>

</body>
</html>
