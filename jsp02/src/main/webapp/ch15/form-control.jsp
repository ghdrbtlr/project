<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<h2>1) form-control</h2>
<div class="mb-3">
 <label for="formEmail" class="form-label">Email address</label>
 <input type="email" class="form-control" id="formEmail"
  placeholder="name@example.com">
</div>
<div class="mb-3">
 <label for="formTextarea" class="form-label">Example textarea</label>
 <textarea class="form-control"  id="formTextarea" rows="3"></textarea>
</div>
<h2>2) Sizing</h2>
<h4>a) form-control Sizing</h4>
<input class="form-control form-control-lg" type="text">
<input class="form-control form-control-sm" type="text">

</body>
</html>
