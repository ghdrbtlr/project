<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.6.0.min.js"></script>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/session_check.jsp" %>

<script type="text/javascript">
$(function () {
  $("#btnLogout").click(function() {
    location.href="${path}/session_servlet/logout.do";
  });
});
</script>

</head>
<body>
<h2>${sessionScope.message}</h2>
${sessionScope.userid}님이 접속중입니다.<br>

<button type="button" id="btnLogout">로그아웃</button>


</body>
</html>
