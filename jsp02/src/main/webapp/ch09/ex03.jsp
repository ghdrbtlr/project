<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- value="숫자처리" -->
<c:set var="num" value="<%=new Integer(100) %>" scope="page" />
<!-- value="문자" -->
<c:set var="num" value="200" scope="request" />
<c:set var="num" value="300" scope="session" />
<c:set var="num" value="400" scope="application" />

${num}<br> <!-- page영역은 생략가능 -->
${pageScope.num}<br>
${requestScope.num}<br>
${sessionScope.num}<br>
${applicationScope.num}<br>

</body>
</html>
