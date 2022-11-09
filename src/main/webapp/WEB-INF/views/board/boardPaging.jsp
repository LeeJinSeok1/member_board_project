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


<html>
<head>
    <title>listPage.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <script src="/resources/js/jqurey.js"></script>

</head>
<body>
<h2 >${sessionScope.loginEmail} 님 환영합니다.</h2>
<div class="form-group">
<a href="/myPage?memberEmail=${sessionScope.loginEmail}" class="btn btn-success">마이 페이지</a>
    <c:if test="${sessionScope.loginEmail == 'admin'}">
        <button class="btn btn-warning" onclick="memberList()">회원목록</button>
    </c:if>
</div>
<div class="container mt-5">
<form action="/search" role="search" method="get">
<div class="form-group">

    <select name="type" class="form-select">
        <option value="boardTitle">제목</option>
        <option value="boardWriter">작성자</option>
    </select>
    <input type="search" name="q" class="form-control" placeholder="검색어" aria-label="Search">

    <input type="submit" class="btn btn-primary" value="검색!">
</div>
</form>
</div>
<div class="form-group">
    <a href="/boardPage?id=${memberDTO.id}" class="btn btn-primary m-lg-5">글 작성</a>
    <a href="/logout" class="btn btn-danger">로그아웃</a>
</div>



<table class="table table-striped table-hover text-center">
    <tr>

        <th>작성자</th>
        <th>제목</th>
        <th>내용</th>
        <th>날짜</th>
        <th>조회수</th>

    </tr>

    <c:forEach items="${boardList}" var="List">
        <tr>

            <td>${List.boardWriter}</td>
            <td><a href="/detailPage?id=${List.id}" onclick="hit(${List.id})">${List.boardTitle}</a></td>
            <td>${List.boardContents}</td>
            <td>${List.boardCreatedDate}</td>
            <td>${List.boardHits}</td>

        </tr>
    </c:forEach>
</table>
<div class="container">
    <ul class="pagination justify-content-center">
        <c:choose>
            <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
            <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <a class="page-link">[이전]</a>
                </li>
            </c:when>
            <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/paging?page=${paging.page-1}">[이전]</a>
                </li>
            </c:otherwise>
        </c:choose>

        <%--  for(int i=startPage; i<=endPage; i++)      --%>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>

                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/paging?page=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">[다음]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/paging?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
</body>
<script>
    const hit =(id) => {
        location.href="/boardHit?id="+id
    }
    const memberList = () => {
        location.href="/memberList"
    }


</script>
</html>
