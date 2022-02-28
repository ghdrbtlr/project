<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session_login.jsp</title>
<script src="../include/jquery-3.6.0.min.js"></script>
<%@ include file="../include/header.jsp" %>

<!-- 
JSTL 명려어
c: 코어 태그
if test="조건식"
param.변수 => request.getParameter("변수")
JSTL은 equals를 안써도 되고, null도 자동 처리되는 등의 장점이 있다. 
 -->

<c:if test="${param.message == 'error'}">
 <script>
  alert("아이디 또는 비밀번호가 일치하지 않습니다.");
 </script>
</c:if>
<c:if test="${param.message == 'logout'}">
 <script>
  alert("로그아웃 되었습니다.");
 </script>
</c:if>

</head>
<body>
<h2>세션 로그인</h2>
<form method="post" name="form1" 
action="${path}/session_servlet/login.do">
<table border="1">
 <tr>
  <td>아이디</td>
  <td><input name="userid"> </td>
 </tr>
 <tr>
  <td>비밀번호</td>
  <td><input type="password" name="passwd"> </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <input type="submit" value="로그인">
  </td>
 </tr>
</table>
</form>

</body>
</html>
