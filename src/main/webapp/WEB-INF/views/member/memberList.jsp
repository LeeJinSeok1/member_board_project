<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-09
  Time: 오전 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>memberList.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
</head>
<body>
<a href="/paging" class="btn btn-primary">돌아가기</a>
<table class="table table-striped table-hover text-center">
    <tr>

        <th>아이디</th>
        <th>이메일</th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>회원삭제</th>

    </tr>

    <c:forEach items="${memberList}" var="member">
        <tr>
            <td>${member.id}</td>
            <td>${member.memberEmail}</td>
            <td>${member.memberPass}</td>
            <td>${member.memberName}</td>
            <td><a href="/memberDelete?id=${member.id}" class="btn btn-danger">삭제</a></td>
        </tr>
    </c:forEach>
</table>


</body>
</html>
