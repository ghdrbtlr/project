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
<%-- <%@ page import="java.util.HashMap" %>
<%
HashMap<String,String> map
=(HashMap<String,String>)request.getAttribute("map");
String[] fruits = {"포도","오렌지","바나나","사과"};//키값을 배열로 만듦
for(String f : fruits){
 out.print("키:"+f+"==>값:"+map.get(f)+"<br>"); 
}
%> --%>

<!-- EL/JSTL 
2가지 방식으로 처리가능
1) ${변수.속성}
2) ${변수["속성"]} : 한글가능

-->
${map["포도"]}<br>
${map["오렌지"]}<br>
${map["바나나"]}<br>
${map["사과"]}<br>

<!-- 전체값을 출력할 경우 -->
<%-- <c:forEach var="fruit" items="${requestScope.map}">
 ${fruit}<br>
</c:forEach> --%>


</body>
</html>
