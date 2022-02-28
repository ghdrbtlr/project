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
<%
//pageContext.setAttribute("country", "Korea");
%>
<c:set var="country"  value="Korea" scope="page"/>
<c:if test="${country != null}">
 국가명 : ${country}<br>
</c:if>

<%
int[] nums={10,70,80,50,40,30,20};
//pageContext.setAttribute("num", nums);
%>

<c:set var="num" value="<%=nums %>" />
<c:forEach var="n" items="${num}">
 ${n},
</c:forEach>
<br>

<!-- 다중조건문 (switch case문) -->
<c:set var="season" value="봄" />
<c:choose>
 <c:when test="${season == '봄'}">
  <img src="/jsp02/images/spring.jpg">
 </c:when>
 <c:when test="${season == '여름'}">
  <img src="/jsp02/images/summer.jpg">
 </c:when>
 <c:when test="${season == '가을'}">
  <img src="/jsp02/images/autumn.jpg">
 </c:when>
 <c:when test="${season == '겨울'}">
  <img src="/jsp02/images/winter3.jpg">
 </c:when>
 <c:otherwise>
   잘못된 입력입니다.
 </c:otherwise>
</c:choose>

</body>
</html>
