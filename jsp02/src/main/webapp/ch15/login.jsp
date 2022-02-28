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
<div class="container">
<h2>로그인</h2>
<form>
 <div class="form-group">
  <label for="email">Email : </label>
  <input type="email" class="form-control" id="email"
   placeholder="Enter Email" name="email">
 </div>
 <div class="form-group">
  <label for="pwd">Password : </label>
  <input type="password" class="form-control" id="pwd"
   placeholder="Enter password" name="pwd">
 </div>
 <div class="form-check">
  <input type="checkbox" class="form-check-input" id="pwdCheck">
   <label class="form-check-label" for="pwdCheck">
    Remember me
   </label>
 </div>
 <button type="submit" class="btn btn-success">로그인</button>
</form>
<div class="dropdown-divider"></div>
<a class="dropdown-item" href="#">회원가입</a>
<a class="dropdown-item" href="#">아이디찾기</a>
<a class="dropdown-item" href="#">비밀번호찾기</a>
</div>

</body>
</html>