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
<%@ page import="java.util.Date" %>  
<%
Date date=new Date();
out.println(date+"<br>");
%>
<!-- 날짜 표현 -->
<c:set var="date" value="<%=date%>" />
${date}<br>
<fmt:formatDate value="${date}"/> <br>
<fmt:formatDate value="${date}" type="date" /> <br>
<fmt:formatDate value="${date}" type="time" /> <br>
<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm:ss" /> <br>

<!-- 숫자표현 -->
<c:set var="num" value="123456789.12" />
${num}<br>
<!-- 천단위 컴머 -->
<fmt:formatNumber value="${num}" groupingUsed="true" /><br>
<!-- 쉼표위치 조정 -->
<fmt:formatNumber value="${num}" pattern="#,####.#" /><br>
<!-- 소수점 이하의 값이 없으면 0으로 채움 -->
<fmt:formatNumber value="${num}" pattern="##,###.000"/><br>

</body>
</html>
