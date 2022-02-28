<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
#form1{float: right;}
#navbar{
background-color:#00BFFF; 
height: 35px;
padding: 0;
}
.ul1{
list-style:none;
display: flex;
padding: 0px;
margin: 0px;
}
.li1{
padding-right: 1.5em;
padding-left: 1em;
margin: 0px;;
}
.li1 > a{color: white;}
.li1:hover > a{color: yellow;}
.li1:hover {background-color: #00A5FF;}
a{text-decoration: none; color: black;}
#footerimg{float: left;}
#loginField{ margin-top: 70px;}
#loginField > input{margin: 10px; width: 40%; height: 40px; }
#btnlogin{background-color: #00BFFF; }
</style>



</head>
<body>
<c:if test="${param.message=='error'}">
<script >
$(function(){
	$("#message").html("아이디 또는 비밀번호가 틀립니다.");
});
</script>
</c:if>
 <div class="container">
  <div style="text-align: right;">
  <c:choose>
   <c:when test="${sessionScope.userid==null}">
   <span style="font-size: 0.9em;"><a href="${path}/my_servlet/join.do">회원가입 </a>| </span>
   <span style="font-size: 0.9em;"><a href="${path}/my_servlet/login.do">로그인</a></span>
   </c:when>
   <c:otherwise>
    <span style="font-size: 0.9em;"><a href="#">내정보</a></span>
    <span style="font-size: 0.9em;"><a href="#">로그아웃</a></span>
   </c:otherwise>
  </c:choose>
  </div>
 </div>
 <hr>
 <div class="container">
  <a href="${path}/my_servlet/list.do?tab=hot"><img width="363px;" height="59px;" src="https://mblogthumb-phinf.pstatic.net/MjAxODA0MTZfNDMg/MDAxNTIzODY3OTUwMzk5.4RJpbOLIHXySrBRmVvpfpwaBaeoCSol3bmILuFlmjBog.W8N581D-AT6vGa4hwhcuWLKbOCQEGdiGDFnPkgk1E-wg.JPEG.raonato2017/1.jpg?type=w800" ></a>
  <div id="form1">
			<form action="${path}/my_servlet/search.do" method="post"
				name="form1">
				
				 <input name="keyword">
				<button id="btnsearch">검색</button>
			</form>
		</div>
  <nav class="navbar" id="navbar"> 
   <ul class="ul1">
				<li class="li1"><a href="${path}/my_servlet/list.do?tab=hot">인기글</a></li>
				<li class="li1"><a href="${path}/my_servlet/list.do?tab=funny">유머/정보</a></li>
				<li class="li1"><a href="${path}/my_servlet/list.do?tab=sports">스포츠</a></li>
				<li class="li1"><a href="${path}/my_servlet/list.do?tab=common">일반</a></li>
				<li class="li1"><a href="${path}/my_servlet/list.do?tab=game">게임</a></li>
				<li class="li1"><a
					href="${path}/my_servlet/list.do?tab=community">커뮤니티</a></li>
			</ul>
  </nav>
  <div class="container" align="center" style="height: 600px">
  
   <form action="${path}/my_member_servlet/login.do" method="post" >
    <fieldset id="loginField">
     <legend><strong><h1>로그인</h1></strong></legend>
      <p>아이디 비밀번호를 입력하신후, 로그인 버튼을 눌러주세요. </p>
        <p style="color: red;" id="message"></p>
      <input placeholder="id" name="userid"><br>
      <input type="password" placeholder="password" name="passwd"><br>
      <input type="submit" value="로그인" id="btnlogin"><br>
      <span><a href="${path}/my_servlet/join.do">회원가입 </a>|</span>
      <span><a>아이디 찾기 </a>|</span>
      <span><a>비밀번호 찾기</a></span>
    </fieldset>
   </form>
   
  </div>
  
  <hr>
  <div class="container" id="footer" >
   <img id="footerimg" width="300px;" height="59px;" src="https://mblogthumb-phinf.pstatic.net/MjAxODA0MTZfNDMg/MDAxNTIzODY3OTUwMzk5.4RJpbOLIHXySrBRmVvpfpwaBaeoCSol3bmILuFlmjBog.W8N581D-AT6vGa4hwhcuWLKbOCQEGdiGDFnPkgk1E-wg.JPEG.raonato2017/1.jpg?type=w800" >
   <h6>&copy Community</h6>
  </div>
  
 </div>

 
</body>
</html>
