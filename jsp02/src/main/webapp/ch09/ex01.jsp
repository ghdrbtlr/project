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
<h2>Java 코드</h2>
<%-- <%@ page import="java.util.Enumeration" %>
<%
Enumeration<String> headerNames=request.getHeaderNames();
while(headerNames.hasMoreElements()){//다음 요소가 있으면
  String key=(String)headerNames.nextElement();//다음 값을 읽음
  String value=request.getHeader(key);//헤더값 조회
  out.println(key+" : "+value+"<br>");
}
%> --%>

<c:forEach var="h" items="${header}">
 ${h.key} => ${h.value} <br>
</c:forEach>
<hr>
<c:set var="browser" value="${header['user-agent']}" scope="page" />

<c:out value="${browser}"></c:out> <!-- out.println(값)같음 -->
${browser}<br>
<hr>
<c:remove var="browser"/> <!-- java의 removeAttribute()대체 -->
<c:out value="${browser}" />
 

</body>

</html>
