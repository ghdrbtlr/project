<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	chk('1');
});

function chk(a){
	alert(a);
}

</script>
</head>
<body>
<h2>test2페이지</h2>
</body>
</html>