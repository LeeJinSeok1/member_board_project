<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-08
  Time: 오전 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardSave.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
</head>
<body>
<%--게시글데이터: 글번호(id), 제목(boardTitle), 작성자(boardWriter), 내용--%>
<%--(boardContents), 조회수(boardHits), 작성일자(boardCreatedDate), 첨부파일명--%>
<%--(boardFileName)--%>
<div class="container mt-5">
    <form action="/boardSave" method="post" class="form-control">
        <input type="text" name="boardWriter" value="${sessionScope.loginEmail}" readonly class="form-control mt-5">
        <input type="text" name="boardTitle" placeholder="제목" class="form-control mt-5">
        <textarea name="boardContents" cols="30" rows="10" class="form-control mt-5" placeholder="내용"></textarea>
        <input type="submit" class="btn btn-primary mt-5" value="글작성!">
    </form>
</div>


</body>
</html>
