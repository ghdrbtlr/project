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
th,td{border-top: 1px solid; border-bottom: 1px solid #d2d2d2;}
td{padding: 1.5em;}
</style>
<script type="text/javascript">
 $(function(){
		$("#btnSave").click(function(){
			var userid=$("#userid").val();
			var passwd=$("#passwd").val();
			var name=$("#name").val();
			var email=$("#email").val();
			var passwd1=$("#passwd1").val();
			if(userid==""){
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			  return;
			}
			if(passwd==""){
				alert("비밀번호를 입력하세요.");
				$("#passwd").focus();
				return;
			}
			if(passwd1 != passwd){
				alert("비밀번호가 맞는지 확인해주세요.");
				$("#passwd1").focus();
				return;
			}
			if(name==""){
				alert("닉네임을 입력해주세요.");
				$("#name").focus();
				return;
			}
			if(email==""){
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return;
			}
			var ex1=/^[a-z-A-Z0-9]{3,20}/;
			if(!ex1.test(userid)){
				alert("아이디를 다시입력해주세요.");
				$("#userid").focus();
				return;
			}
			var ex2=/^.{6,20}$/;
			if(!ex2.test(passwd)){
				alert("비밀번호를 다시입력해주세요.");
				$("#passwd").focus();
				return;
			}
			var ex3=/^.{2,8}$/;
			if(!ex3.test(name)){
				alert("닉네임을 다시입력해주세요.");
				$("#name").focus();
				return;
			}
			document.form2.action="${path}/my_member_servlet/join.do";
			document.form2.submit();
			
		});
	});
		
 </script>

</head>
<body>
 <div class="container">
  <div style="text-align: right;">
   <span style="font-size: 0.9em;"><a href="join.jsp">회원가입 </a>| </span>
   <span style="font-size: 0.9em;"><a href="${path}/my_servlet/login.do">로그인</a></span>
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
  
  <h2>회원 가입</h2>
  <form name="form2" method="post">
  <table style="width: 100%;" >
   <th colspan="2" style="text-align: center;">기본정보</th>
   <tr>
    <td><strong>아이디</strong></td>
    <td><input name="userid" id="userid">
    <br>사용자 ID는 3~20자 사이의 영문+숫자로 이루어져있어야합니다.
    </td>
   </tr>
   <tr>
    <td><strong>비밀번호</strong></td>
    <td><input type="password" name="passwd" id="passwd">
    <br>비밀번호는 6~20자로 되어야 합니다.
    </td>
   </tr>
   <tr>
    <td><strong>비밀번호 확인</strong></td>
    <td><input type="password"  id="passwd1"></td>
   </tr>
   <tr>
    <td><strong>닉네임</strong></td>
    <td><input name="name" id="name">
    <br>닉네임은 2~8자 이내여야 합니다.
    </td>
   </tr>
   <tr>
    <td><strong>이메일 주소</strong></td>
    <td><input type="email" name="email" id="email"></td>
   </tr>
   
   <td colspan="2" style="text-align: right;">
   <input id="btnSave" type="button" value="가입하기"><td>
   
  </table>
  
  </form>
 </div>
 <div class="container">
   <img id="footerimg" width="300px;" height="59px;" src="https://mblogthumb-phinf.pstatic.net/MjAxODA0MTZfNDMg/MDAxNTIzODY3OTUwMzk5.4RJpbOLIHXySrBRmVvpfpwaBaeoCSol3bmILuFlmjBog.W8N581D-AT6vGa4hwhcuWLKbOCQEGdiGDFnPkgk1E-wg.JPEG.raonato2017/1.jpg?type=w800" >
   <h6>&copy Community</h6>
  </div>
  

</body>
</html>
