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
table {
	border-bottom: 1px solid black;
	border-top: 1px solid black;
}
th,td {
border-bottom: 1px dotted gray;
padding: 1em;
}
#btn{margin-top: 10px;}
</style>
<script type="text/javascript">
function back(){
	window.history.back();
}
if(${param.message=='error'}){
	alert("비밀번호 또는 닉네임 형식이 틀립니다.")
}

</script>


</head>
<body>
 <div class="container">
  <div style="text-align: right;">
  <c:choose>
   <c:when test="${sessionScope.userid == null}">
   <span style="font-size: 0.9em;"><a href="${path}/my_servlet/join.do">회원가입 </a>| </span>
   <span style="font-size: 0.9em;"><a href="${path}/my_servlet/login.do">로그인</a></span>
   </c:when>
   <c:otherwise>
    <span style="font-size: 0.9em;"><a href="${path}/my_member_servlet/view.do">내정보</a></span>
    <span style="font-size: 0.9em;"><a href="${path}/my_servlet/mywriting.do">내글</a></span>
    <span><strong style="color: blue;">${sessionScope.result}</strong>님 </span>
    <span style="font-size: 0.9em;"><a href="${path}/my_member_servlet/logout.do">로그아웃</a></span>
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
				<li class="li1"><a href="${path}/my_servlet/list.do?tab=community">커뮤니티</a></li>
   </ul>
  </nav>
  <h3>회원 정보 수정</h3>
  <form name="form2" method="post" action="${path}/my_member_servlet/update.do" >
  <table style="width: 100%">
   <tr>
    <th  colspan="2" style="text-align: center; " >기본 정보</th>
   </tr>
   <tr>
    <td><strong>아이디</strong></td>
    <td>${dto.userid}</td>
   </tr>
   <tr>
    <td><strong>현재 비밀번호</strong></td>
    <td><input name="passwd" type="password"><br>
    정보 변경을 위해 현재 비밀번호를 입력하시길 바랍니다.</td>
   </tr>
   <tr>
    <td><strong>닉네임</strong></td>
    <td><input name="name" value="${dto.name}"><br>
    닉네임은 2~8자 이내여야 합니다.</td>
   </tr>
   <tr>
    <td><strong>메일주소</strong></td>
    <td><input name="email" value="${dto.email}"></td>
   </tr>
   <tr>
    <td><strong>가입일</strong></td>
    <td><fmt:formatDate  value="${dto.join_date}" pattern="yyyy-MM-dd"/> </td>
   </tr>
  </table>
  <div id="btn" align="right">
   <input type="submit" value="수정" id="update">
   <input type="button" value="취소" onclick="back()">
  </div>
  </form>
  
  
  
  <hr>
  <div class="container">
   <img id="footerimg" width="300px;" height="59px;" src="https://mblogthumb-phinf.pstatic.net/MjAxODA0MTZfNDMg/MDAxNTIzODY3OTUwMzk5.4RJpbOLIHXySrBRmVvpfpwaBaeoCSol3bmILuFlmjBog.W8N581D-AT6vGa4hwhcuWLKbOCQEGdiGDFnPkgk1E-wg.JPEG.raonato2017/1.jpg?type=w800" >
   <h6>&copy Community</h6>
  </div>
  
  
 </div>
</body>
</html>
