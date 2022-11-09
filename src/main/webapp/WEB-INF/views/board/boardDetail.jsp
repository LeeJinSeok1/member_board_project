<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-08
  Time: 오후 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>boardDetail.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js/jqurey.js"></script>
     <h2 hidden>${sessionScope.loginEmail}</h2>
     <h2 hidden>${board.boardWriter}</h2>
    <style>
        #comment-writer{
            width: 600px;
        }
    </style>

</head>
<body>


<div class="container" id="detail">
    <table class="table table-hover">
        <tr>
            <th>id</th>
            <td>${board.id}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${board.boardWriter}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${board.boardTitle}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${board.boardContents}</td>
        </tr>
        <tr>
            <th>날짜</th>
            <td>${board.boardCreatedDate}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.boardHits}</td>
        </tr>

    </table>
</div>

<%--<c:choose>--%>
<%--    &lt;%&ndash; 현재 페이지가 1페이지면 이전 글자만 보여줌 &ndash;%&gt;--%>
<%--    <c:set var="loginEmail" value="${sessionScope.loginEmail}"/>--%>

<%--    <c:when test="${loginEmail eq 'maefx04@nate.com'}">--%>
<%--        <div class="container">--%>
<%--            <button  class="btn btn-warning" onclick="boardUpdate()">수정</button>--%>
<%--            <button  class="btn btn-danger" onclick="boardDelete()">삭제</button>--%>
<%--        </div>--%>
<%--    </c:when>--%>

<%--</c:choose>--%>

<div class="container" id="btn">
    <button class="btn btn-primary" onclick="boardBack()">돌아가기</button>
    <c:if test="${sessionScope.loginEmail eq board.boardWriter }">
        <button  class="btn btn-warning" onclick="boardUpdate()">수정</button>
        <button  class="btn btn-danger" onclick="boardDelete()">삭제</button>
    </c:if>
<%--    <button  class="btn btn-warning" onclick="boardUpdate()">수정</button>--%>
<%--    <button  class="btn btn-danger" onclick="boardDelete()">삭제</button>--%>
</div>
<%--댓글기능--%>
<div class="container mt-5" >
    <div id="comment-writer" class="input-group mb-3">
        <%--                             인풋 그룹을 써서 한줄로 표현--%>
        <div class="form-floating">
            <input type="text" id="commentWriter" class="form-control" placeholder="작성자">
            <label for="commentWriter"> 작성자</label>

        </div>
        <div class="form-floating">
            <input type="text" id="commentContents" class="form-control" placeholder="내용">
            <label for="commentContents">내용</label>

        </div>
        <button id="comment-write-btn"  class="btn btn-primary" onclick="commentWrite()">댓글작성</button>
    </div>
</div>
</div>
<div class="container mt-5" id="comment-list">
    <table class="table">
        <tr>
            <th>댓글번호</th>
            <th>작성자</th>
            <th>내용</th>
<%--            <th>작성시간</th>--%>
        </tr>
        <c:forEach items="${commentList}" var="comment">
            <tr>
                <td>${comment.id}</td>
                <td>${comment.commentWriter}</td>
                <td>${comment.commentContents}</td>
<%--                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>--%>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
<script>
    const boardUpdate = () => {

            location.href="/boardUpdate?id="+${board.id}

    }
    const boardDelete = () => {
        location.href="/boardDelete?id="+${board.id}
    }
    const boardBack = () => {
        location.href="/paging"
    }

    const commentWrite= () => {
        const commentWriter = document.getElementById("commentWriter").value;
        const commentContents = document.getElementById("commentContents").value;
        const boardId = '${board.id}'
        $.ajax({
            type: "post",
            url: "/commentSave",
            data: {
                commentWriter : commentWriter,
                commentContents : commentContents,
                boardId : boardId
            },
            dateType: "json",
            success: function (commentList) {
                console.log(commentList)
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                // output += "<th>작성시간</th></tr>";
                for(let i in commentList){
                    output += "<tr>";
                    output += "<td>"+commentList[i].id+"</td>";
                    output += "<td>"+commentList[i].commentWriter+"</td>";
                    output += "<td>"+commentList[i].commentContents+"</td>";
                    // output += "<td>"+moment(commentList[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentWriter').value='';
                document.getElementById('commentContents').value='';


            },
            error: function () {

                console.log("실패")
            }
        })

    }

</script>

</html>
