<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>navbar</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<!-- navbar-expand-lg : 메뉴네비게이션의 큰화면 cf) sm < md < lg < xl -->
<!-- 백그라운드 컬러 : bg-dark, bg-light, bg-primary, ... -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<!-- container-fluid는 가로크기를 기기해상도 상관없이 100%로 지정 -->
 <div class="container-fluid">
 <!-- navbar-brand : 브랜드로고로 굵은 글자체로 강조됨 -->
 <!-- 이미지라면 주변요소와 어울리도록 자동 위치 조절됨 -->
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" 
  data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
  aria-controls="navbarSupportedContent" aria-expanded="false" 
  aria-label="Toggle navigation">
   <span class="navbar-toggler-icon"></span>
  </button>
 </div>
 <div class="collapse navbar-collapse" id="navbarSupportedContent">
  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
   <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">Home</a>
   </li>
   <li class="nav-item">
    <a class="nav-link" href="#">Login</a>
   </li>
   <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" 
    id="navbarDropdown" role="button" data-bs-toggle="dropdown"
    aria-expanded="false">Dropdown</a>
    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
     <li><a class="dropdown-item">Action</a></li>
     <li><a class="dropdown-item">Another action</a></li>
     <li><hr class="dropdown-divider"></li>
     <li><a class="dropdown-item">Something else here</a> </li>
    </ul>
   </li>
   <li class="nav-item">
    <a class="nav-link disabled" href="#" tabindex="-1" 
    aria-disabled="true">Disabled</a>
   </li>
  </ul>
  <form class="d-flex">
   <input class="form-control me-2" type="search" 
   placeholder="Search" aria-label="Search">
   <button class="btn btn-outline-success" type="submit">Search</button>
  </form>
 </div>
</nav>

</body>
</html>
