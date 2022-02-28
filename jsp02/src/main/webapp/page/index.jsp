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
	list('1');//1페이지란 뜻
});

function list(curPage){
	var param="curPage="+curPage;
	$.ajax({
		type: "post",
		url: "${path}/page_servlet/list.do",
		data: param,
		success: function(result){
			$("#result").html(result);
		}
	});
}

</script>
</head>
<body>
<h2>페이지 나누기</h2>

<div id="result"></div>

</body>
</html>
