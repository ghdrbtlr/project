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
$(function(){
	$("#btnSave").click(function() {
		var writer=$("#writer").val();
		var subject=$("subject").val();
		var content=$("#content").val();
		var passwd=$("#passwd").val();
		if(writer==""){
			alert("이름을 입력하세요.");
			$("#writer").focus();
			return;
		}
		if(subject==""){
			alert("제목을 입력하세요.");
			$("#subject").focus();
			return;
		}
		if(content==""){
			alert("내용을 입력하세요.");
			$("#content").focus();
			return;
		}
		if(passwd==""){
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
		}
		document.form1.submit();
	});
});
</script>


</head>
<body>
<h2>글쓰기</h2>
<form name="form1" method="post" enctype="multipart/form-data"
action="${path}/board_servlet/insert.do">
<table border="1" style="width: 100%;">
 <tr>
  <td>이름</td>
  <td><input name="writer" id="writer"> </td>
 </tr>
 <tr>
  <td>제목</td>
  <td><input name="subject" id="subject" size="60"> </td>
 </tr>
 <tr>
  <td>본문</td>
  <td><textarea rows="5" cols="60" name="content" id="content">
  </textarea> </td>
 </tr>
  <tr>
  <td>첨부파일</td>
  <td><input type="file" name="file1" id="file1"> </td>
 </tr>
 <tr>
  <td>비밀번호</td>
  <td><input type="password" name="passwd" id="passwd"> </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <input type="button" value="확인" id="btnSave">
  </td>
 </tr>
</table>

</form>
</body>
</html>
