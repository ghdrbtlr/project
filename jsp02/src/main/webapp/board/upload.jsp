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
<h2>파일 업로드</h2>
<!-- 파일업로드시에는 form태그에 전송방식은 반드시 post 방식일뿐만 아니라 
enctype="multipart/form-data" 파일업로드 타입지정도 반드시 해야한다. -->
<form name="form1" method="post" enctype="multipart/form-data"
 action="upload_result.jsp">
이름 : <input name="name"> <br>
제목 : <input name="subject"> <br> 
파일1 : <input type="file" name="file1"> <br>
파일2 : <input type="file" name="file2"> <br>
<input type="submit" value="업로드">
</form>

</body>
</html>