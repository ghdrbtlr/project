<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDTO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnUpdate").click(function(){
		document.form1.action="/jsp02/member_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
		 document.form1.action="/jsp02/member_servlet/delete.do";
		 document.form1.submit();
		}
	});
});
</script>

</head>
<body>
<%
MemberDTO dto=(MemberDTO)request.getAttribute("dto");
%>
<form name="form1" method="post">
<table border="1">
 <tr>
  <td>아이디</td>
  <td><%= dto.getUserid() %> </td>
 </tr>
 <tr>
  <td>비빌번호</td>
  <td><input type="password" name="passwd" 
  value="<%= dto.getPasswd() %>"> </td>
 </tr>
 <tr>
  <td>이름</td>
  <td><input name="name" 
  value="<%= dto.getName() %>"> </td>
 </tr>
 <tr>
  <td>회원가입일자</td>
  <td><%= dto.getJoin_date() %> </td>
 </tr>
 <tr>
  <td>이메일</td>
  <td><input name="email" 
  value="<%= dto.getEmail() %>"> </td>
 </tr>
 <tr>
  <td>휴대폰</td>
  <td><input name="hp" 
  value="<%= dto.getHp() %>"> </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <input type="hidden" name="userid" value="<%= dto.getUserid() %>">
   <button type="button" id="btnUpdate">수정</button>
   <button type="button" id="btnDelete">삭제</button>
  </td>
 </tr>
</table>
</form>

</body>
</html>
