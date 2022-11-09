<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-04
  Time: 오전 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <style>
        #home{
            text-align: center;
        }
    </style>
</head>
<body>

<%--i. index.jsp에는 회원가입, 로그인, 글목록으로 가는 버튼(또는 링크) 있음--%>
<div class="container mt-5"  id="home">
    <table>

        <td>  <button class="btn btn-primary" onclick="save_member_fun()">회원가입</button>  </td>

        <td>  <button class="btn btn-primary" onclick="login_page_fun()">로그인</button>  </td>

        <td>  <button class="btn btn-primary" onclick="list_page_fun()">글목록</button> </td>
    </table>

</div>

</body>
    <script>
        const save_member_fun = () => {
            location.href="/savePage"
        }
        const list_page_fun = () => {
            location.href="/listPage"
        }
        const login_page_fun = () => {
            location.href="/loginPage"
        }
    </script>
</html>
