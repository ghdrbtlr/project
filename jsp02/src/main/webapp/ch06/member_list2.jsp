<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.6.0.min.js"></script>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function view(userid){
	document.form1.userid.value = userid;
	document.form1.submit();
}

</script>

</head>
<body>

등록된 회원수 : ${map.count }명<br>
<table border="1" width="100%">
 <tr>
  <th>이름</th>
  <th>아이디</th>
  <th>가입일자</th>
  <th>이메일</th>
  <th>핸드폰</th>
 </tr>
<c:forEach var="dto" items="${map.list }">
 <tr>
  <td>
   <a href="#" onclick="view('${dto.userid}')">${dto.name }</a>
  </td>
  <td>${dto.userid }</td> <!-- 멤버변수명이 아닌 실제로는 getter메소드 호출 -->
  <td>${dto.join_date }</td>
  <td>${dto.email }</td>
  <td>${dto.hp }</td>
 </tr>


</c:forEach>
</table>

<form name="form1" method="post" 
action="/jsp02/member_servlet/view.do">
 <input type="hidden" name="userid">

</form>


</body>
</html>
