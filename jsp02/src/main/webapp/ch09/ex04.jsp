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
<c:forEach var="i" begin="${param.start}" end="${param.end}" varStatus="status">
 <h2>${i}단</h2>
 <h3>반복횟수 : ${status.count}</h3>
 <c:forEach var="j" begin="1" end="9">
  ${i} x ${j} = ${i * j} <br>
 </c:forEach>
</c:forEach>

</body>
</html>
