<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-08
  Time: 오전 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
<html>
<head>
    <title>listPage.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js/jqurey.js"></script>

</head>
<body>
<div class="form-group">

    <a href="/save_board" class="btn btn-primary ">글 작성</a>
    <a href="/" class="btn btn-primary">돌아가기</a>

</div>
<table class="table table-striped table-hover text-center">
    <tr>

        <th>작성자</th>
        <th>제목</th>
        <th>내용</th>
        <th>날짜</th>
        <th>조회수</th>

    </tr>

    <c:forEach items="${List}" var="boardList">
        <tr>

            <td>${boardList.boardWriter}</td>
            <td>${boardList.boardTitle}</td>
            <td>${boardList.boardContents}</td>
            <td>${boardList.boardCreatedDate}</td>
            <td>${boardList.boardHits}</td>

        </tr>
    </c:forEach>
</table>


</body>
 <script>
     const hit =(id) => {
        location.href="/boardHit?id="+id
     }

 </script>
</html>
