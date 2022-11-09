<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-08
  Time: 오후 1:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardUpdatePage.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
</head>
<body>
<div class="container mt-5">
    <form action="/boardUpdate2" method="get" class="form-control">
        <input type="text" name="id" value="${board.id}" readonly class="form-control" hidden>
        <input type="text" name="boardWriter" value="${board.boardWriter}" readonly class="form-control">
        <input type="text" name="boardTitle" value="${board.boardTitle}" class="form-control">
        <textarea name="boardContents" cols="30" rows="10" class="form-control" placeholder="내용">
            ${board.boardContents}
        </textarea>
        <input type="submit" class="btn btn-primary" value="수정완료">
    </form>
</div>

</body>
</html>
