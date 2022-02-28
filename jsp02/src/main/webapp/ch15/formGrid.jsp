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
<form class="row g-3">
 <div class="col-md-6">
  <label for="inputEmail" class="form-label">Email</label>
  <input type="email" class="form-control" id="inputEmail">
 </div>
 <div class="col-md-6">
  <label for="inputPassword" class="form-label">Password</label>
  <input type="password" class="form-control" id="inputPassword">
 </div>
 <div class="col-md-6">
  <label for="inputName" class="form-label">Name</label>
  <input type="text" class="form-control" id="inputName">
 </div>
 <div class="col-12">
  <label for="inputAddress" class="form-label">Address</label>
  <input type="text" class="form-control" id="inputAddress" 
  placeholder="1234 Main St">
 </div>
 <div class="col-12">
  <label for="inputAddress2" class="form-label">Address2</label>
  <input type="text" class="form-control" id="inputAddress2" 
  placeholder="APT, floor">
 </div>
 <div class="col-md-6">
  <label for="inputCity" class="form-label">City</label>
  <input type="text" class="form-control" id="inputCity">
 </div>
 <div class="col-md-4">
  <label for="inputState" class="form-label">State</label>
  <select id="inputState" class="form-select">
   <option selected>대한민국</option>
   <option>미국</option>
   <option>...</option>
  </select>
 </div>
 <div class="col-md-2">
  <label for="inputZip" class="form-label">Zip</label>
  <input type="text" class="form-control" id="inputZip">
 </div>
 <div class="col-12">
  <div class="form-check">
   <input class="form-check-input" type="checkbox" id="gridCheck">
   <label class="form-check-label" for="gridCheck">
    Check me out
   </label>
  </div>
 </div>
 <div class="col-12">
  <button type="submit" class="btn btn-primary">Sing in</button>
 </div>
</form>
</div>
</body>
</html>
