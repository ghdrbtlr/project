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
<%-- <%@ page import="java.util.ArrayList" %>
<%
ArrayList<String> items=(ArrayList<String>)request.getAttribute("items");
for(String str : items){
 out.print(str + "<br>");
}
%> --%>

<!-- EL/JSTL -->
<!-- forEach문도 2가지 종류가 있다.
1) forEach var="변수" begin="시작" end="끝" - java의 일반 for문과 비슷
2) forEach var="개별값" items="집합" - java의 확장 for문과 비슷
 -->

<c:forEach var="fruit" items="${requestScope.items}">
 ${fruit} <br>
</c:forEach>

</body>
</html>
