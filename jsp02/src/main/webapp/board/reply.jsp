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
function updateReply(){
	var writer=$("#writer").val();
	var passwd=$("#passwd").val();
	if(writer==""){
		alert("이름을 입력하세요.");
		$("#writer").focus();
		return;
	}
	if(passwd==""){
		alert("비밀번호를 입력하세요.");
		$("#passwd").focus();
		return;
	}
	document.form1.submit();
}


</script>
</head>
<body>
<h2>답변쓰기</h2>
<form name="form1" method="post" 
action="${path}/board_servlet/insertReply.do">
<table style="border: 1px solid; width: 100%;">
 <tr>
  <td>이름</td>
  <td><input name="writer" id="writer"> </td>
 </tr>
 <tr>
  <td>제목</td>
  <td><input name="subject" id="subject" 
  value="Re: ${dto.subject}" size="60"> </td>
 </tr>
 <tr>
  <td>본문</td>
  <td><textarea rows="5" cols="60" name="content" 
  id="content">${dto.content}</textarea> </td>
 </tr>
 <tr>
  <td>비밀번호</td>
  <td><input type="password" name="passwd" id="passwd"> </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <input type="hidden" name="num" value="${dto.num}">
   <input type="button" value="확인" onclick="updateReply()">
  </td>
 </tr>
</table>



</form>

</body>
</html>
