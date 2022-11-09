<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-09
  Time: 오전 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
</head>
<body>

<div class="container mt-5" id="detail">
    <a href="/paging" class="btn btn-primary">돌아가기</a>
    <table class="table table-hover">
        <tr>
            <th>id</th>
            <td>${member.id}</td>
        </tr>
        <tr>
            <th>성함</th>
            <td>${member.memberName}</td>
        </tr>
        <tr>
            <th>메일</th>
            <td>${member.memberEmail}</td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td>${member.memberPass}</td>
        </tr>
        <tr>
            <th>이름 수정</th>
            <td><a href="/memberUpdate?id=${member.id}" class="btn btn-warning">수정하기</a></td>
        </tr>
        <tr>
            <th>삭제</th>
            <td><a href="/memberDelete?id=${member.id}" class="btn btn-danger">삭제하기</a></td>
        </tr>
    </table>
</div>

</body>
</html>
