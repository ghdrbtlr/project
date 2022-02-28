<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.6.0.min.js"></script>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%-- <%
int num=Integer.parseInt(request.getParameter("num"));
int sum=0;
for(int i=1; i<=num; i++){
 sum += i; 
}
%>

합계 : <%= sum %> <br> --%>

<c:set var="sum" value="0" />
<c:forEach var="i" begin="1" end="${param.num}">
 <c:set var="sum" value="${sum + i}" />
</c:forEach> 
합계 : ${sum} <br>


</body>
</html>