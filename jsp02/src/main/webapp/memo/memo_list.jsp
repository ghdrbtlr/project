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
<table border="1" width="500px">
 <tr>
  <th>번호</th>
  <th>이름</th>
  <th width="50%">메모</th>
  <th>날짜</th>
 </tr>
<c:forEach var="row" items="${list}">
 <tr>
  <td>${row.idx}</td><!-- getIdx()를 호출 -->
  <td>${row.writer}</td>
  <td><a href="${path}/memo_servlet/view.do?idx=${row.idx}">
  ${row.memo}</a></td>
  <td>${row.post_date}</td>
 </tr>
</c:forEach>
</table>
</body>
</html>
