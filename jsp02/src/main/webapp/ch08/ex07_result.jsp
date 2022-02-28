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
<%-- <%@ page import="member.MemberDTO" %>
<%
MemberDTO dto=(MemberDTO)request.getAttribute("dto");
if(dto != null){
 out.println("이름:"+dto.getName()+"<br>");
 out.println("아이디:"+dto.getUserid()+"<br>");
 out.println("비번:"+dto.getPasswd()+"<br>");
}else{
 out.println("출력할 값이 없습니다."); 
}
%> --%>

<!-- EL/JSTL -->
이름 : ${dto.name}<br> <!-- 내부적으로 dto.getName()호출  -->
아이디 : ${dto.userid}<br>
비번 : ${dto.passwd}<br>


</body>
</html>
