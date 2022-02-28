<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%-- <%
String name=request.getParameter("name");
if(name==null){
	name="";
}

%> --%>



<!-- form 태그에 action="url"을 생략하면 자신의 페이지가 호출되어 실행된다. -->
<form >
 이름 : <input name="name" value="${param.name }">
 <input type="submit" value="확인">
</form>

이름 : ${param.name } <br>

</body>
</html>