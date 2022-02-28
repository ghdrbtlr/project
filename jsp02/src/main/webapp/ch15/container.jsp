<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	winSize();
});
function winSize(){
	var w=window.innerWidth;//outerWidth(바깥쪽 넓이값)
	var h=window.innerHeight;//outerHeight(바깥쪽 넓이값)
 var txt = "현재 브라우저 크기 : 가로="+w+",세로="+h;
	document.getElementById("result").innerHTML = txt;
}
</script>
</head>
<!-- onresize : 브라우저 크기가 변경될 때의 이벤트핸들러 -->
<body onresize="winSize()">
<h2 id="result"></h2>
<div class="container">
1) container(고정폭 레이아웃을 만들 때 사용한다.) : 레이아웃을 만드는 가장 상위 요소이다.
가로 해상도 576px 이하에서는 100%, 768px 이상에서는 720px, 992px 이상에서는 960px,
1200px 이상에서는 1140px, 1400px이상에서는 1320px의 가로폭을 가진다.
</div>
<div class="container-sm">2) container-sm </div>
<div class="container-md">3) container-md </div>
<div class="container-lg">4) container-lg </div>
<div class="container-xl">5) container-xl </div>
<div class="container-xxl">6) container-xxl </div>
<div class="container-fluid">
7) container-fluid(좌우로 꽉 찬 레이아웃을 만들 때 사용한다.) </div>
<hr>
<table class="table">
 <thead>
  <tr>
   <td class="border-dark"></td>
   <th scope="col">
    Extra small<br>
    <span class="fw-normal">&lt;576px</span>
   </th>
   <th scope="col">
    Small<br>
    <span class="fw-normal">&ge;576px</span>
   </th>
   <th scope="col">
    Medium<br>
    <span class="fw-normal">&ge;768px</span>
   </th>
   <th scope="col">
    Large<br>
    <span class="fw-normal">&ge;992px</span>
   </th>
   <th scope="col">
    X-Large<br>
    <span class="fw-normal">&ge;1200px</span>
   </th>
   <th scope="col">
    XX-Large<br>
    <span class="fw-normal">&ge;1400px</span>
   </th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <th scope="row" class="fw-normal"><code>.container</code></th>
   <td class="text-muted">100%</td>
   <td>540px</td>
   <td>720px</td>
   <td>960px</td>
   <td>1140px</td>
   <td>1320px</td>
  </tr>
  <tr>
   <th scope="row" class="fw-normal"><code>.container-sm</code></th>
   <td class="text-muted">100%</td>
   <td>540px</td>
   <td>720px</td>
   <td>960px</td>
   <td>1140px</td>
   <td>1320px</td>
  </tr>
  <tr>
   <th scope="row" class="fw-normal"><code>.container-md</code></th>
   <td class="text-muted">100%</td>
   <td class="text-muted">100%</td>
   <td>720px</td>
   <td>960px</td>
   <td>1140px</td>
   <td>1320px</td>
  </tr>
  <tr>
   <th scope="row" class="fw-normal"><code>.container-lg</code></th>
   <td class="text-muted">100%</td>
   <td class="text-muted">100%</td>
   <td class="text-muted">100%</td>
   <td>960px</td>
   <td>1140px</td>
   <td>1320px</td>
  </tr>
  <tr>
   <th scope="row" class="fw-normal"><code>.container-xl</code></th>
   <td class="text-muted">100%</td>
   <td class="text-muted">100%</td>
   <td class="text-muted">100%</td>
   <td class="text-muted">100%</td>
   <td>1140px</td>
   <td>1320px</td>
  </tr>
  <tr>
   <th scope="row" class="fw-normal"><code>.container-xxl</code></th>
   <td class="text-muted">100%</td>
   <td class="text-muted">100%</td>
   <td class="text-muted">100%</td>
   <td class="text-muted">100%</td>
   <td class="text-muted">100%</td>
   <td>1320px</td>
  </tr>
  <tr>
   <th scope="row" class="fw-normal"><code>.container-fluid</code></th>
   <td class="text-muted">100%</td>
   <td class="text-muted">100%</td>
   <td class="text-muted">100%</td>
   <td class="text-muted">100%</td>
   <td class="text-muted">100%</td>
   <td class="text-muted">100%</td>
  </tr>
 </tbody>
</table>

</body>
</html>
