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
<body onresize="winSize()">
<h2 id="result"></h2>
<h2>부트 스트랩 그리드 시스템</h2>
<p>Bootstrap의 그리드 시스템은 페이지에 최대 12개의 열을 허용한다.
12개의 열을 모두 개별적으로 사용하지 않으려면 열을 함께 그룹화하여 더 넓은 열을
만들 수 있다.
</p>
<div class="container-fluid">
 <h4>부트 스트랩 그리드의 기본 구조</h4>
 <p>효과를 보려면 브라우저 창의 크기를 조정한다.</p>
 <p>화면 너비가 576px 미만일 때 첫째, 둘째, 세째행은 자동으로 위로 쌓인다.</p>
 
 <div class="container-fluid">
  <div class="row">
   <div class="col-sm-6" style="background-color: yellow;">50%</div>
   <div class="col-sm-6" style="background-color: orange;">50%</div>
  </div>
  <div class="row">
   <div class="col-sm-4" style="background-color: yellow;">33.33%</div>
   <div class="col-sm-4" style="background-color: orange;">33.33%</div>
   <div class="col-sm-4" style="background-color: yellow;">33.33%</div>
  </div>
  <br>
  <div class="row">
   <div class="col-sm" style="background-color: yellow;">25%</div>
   <div class="col-sm" style="background-color: orange;">25%</div>
   <div class="col-sm" style="background-color: yellow;">25%</div>
   <div class="col-sm" style="background-color: orange;">25%</div>
  </div>
  <br>
  <div class="row">
   <div class="col" style="background-color: yellow;">25%</div>
   <div class="col" style="background-color: orange;">25%</div>
   <div class="col" style="background-color: yellow;">25%</div>
   <div class="col" style="background-color: orange;">25%</div>
  </div>
 </div>
</div>

<hr>
<p>참고) 그리드 옵션 : col-(576px이하) < col-sm(576px이상) 
< col-md(768px이상) < col-lg(992px이상) < col-xl(1200px이상)
 < col-xxl(1400px이상)</p>
<hr>
<h4>sm은 578px이상 되면 숫자만큼 등간격을 유지함</h4>
<div class="container">
 <div class="row">
  <div class="col-sm-1">col-sm-1</div>
  <div class="col-sm-2">col-sm-2</div>
  <div class="col-sm-3">col-sm-3</div>
  <div class="col-sm-4">col-sm-4</div>
 </div>
</div> 

<div class="container">
 <div class="row">
  <div class="col-sm-8">col-sm-8</div>
  <div class="col-sm-4">col-sm-4</div>
 </div>
 <div class="row">
  <div class="col-sm">col-sm</div>
  <div class="col-sm">col-sm</div>
  <div class="col-sm">col-sm</div>
 </div>
</div>
<hr>
<h4>믹스 앤 매치</h4>
<div class="container">
 <p>소형기기에서 50%분할 및 대형기기에서 75%/25% 분할</p>
 <div class="row">
  <div class="col-6 col-sm-9 bg-success">col-6 col-sm-9</div>
  <div class="col-6 col-sm-3 bg-warning">col-6 col-sm-3</div>
 </div>
 <p>소형 및 중형기기에서 58%/42%분할 및 대형기기에서 66.3%/33.3% 분할</p>
 <div class="row">
  <div class="col-7 col-lg-8 bg-success">col-7 col-lg-8</div>
  <div class="col-5 col-lg-4 bg-warning">col-5 col-lg-4</div>
 </div>
 <p>소형 기기에서 25%/75%분할 및 중형기기에서 50%/50%, 대형기기에서 33%/66% 분할
 매우 작은 기기에서는 자동으로 100%</p>
 <div class="row">
  <div class="col-sm-3 col-md-6 col-lg-4 bg-success">col-sm-3 col-md-6 col-lg-4</div>
  <div class="col-sm-9 col-md-6 col-lg-8 bg-warning">col-sm-9 col-md-6 col-lg-8</div>
 </div>
</div>
<p>


</body>
</html>
