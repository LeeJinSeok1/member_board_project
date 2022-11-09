<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-09
  Time: 오전 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>save_board.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <style>
        #ckBox{
            color: red;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <form action="/boardSave" method="get" class="form-control">
        <input type="text" name="boardWriter" value="비회원" readonly class="form-control mt-5">
        <h5 id="ckBox">회원가입 후 수정 가능합니다.</h5>
        <input type="text" name="boardTitle" placeholder="제목" class="form-control mt-5">
        <textarea name="boardContents" cols="30" rows="10" class="form-control mt-5" placeholder="내용">
        </textarea>
        <input type="submit" class="btn btn-primary mt-5" value="글작성!">
    </form>
</div>

</body>
</html>
