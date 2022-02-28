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
#write  {
border: 1px solid gray;
padding: 0.5em;
border-radius: 0.5em;
}
#tab,#subject{margin-bottom: 1em;}
#tab{height: 30px;}
#btnwrite{background-color: #00A5FF; color: white; width: 80px; border-radius: 0.5em; margin : 15px 20px 0 0;}
</style>



</head>
<body>
 <div class="container">
  <div style="text-align: right;">
  <c:choose>
   <c:when test="${sessionScope.userid==null}">
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
  <h3>글쓰기</h3>
  
  <form action="${path}/my_servlet/write.do" name="form2" method="post" enctype="multipart/form-data">
   <div id="write">
   <select name="tab" style="width: 20%;" id="tab">
    <option value="funny">유머/정보</option>
    <option value="sports">스포츠</option>
    <option value="common">일반</option>
    <option value="game">게임</option>
    <option value="community">커뮤니티</option>
   </select>
   <input id="subject" name="subject" style="width: 72%;" placeholder="제목">
   <textarea rows="20" cols="111" name="content"></textarea>
   <input type="file" name="filename">
   </div>
   <div  align="right"><input type="submit" value="등록" id="btnwrite"></div>
  </form>
  
  
  
  
  <hr>
  <div class="container" id="footer" >
   <img id="footerimg" width="300px;" height="59px;" src="https://mblogthumb-phinf.pstatic.net/MjAxODA0MTZfNDMg/MDAxNTIzODY3OTUwMzk5.4RJpbOLIHXySrBRmVvpfpwaBaeoCSol3bmILuFlmjBog.W8N581D-AT6vGa4hwhcuWLKbOCQEGdiGDFnPkgk1E-wg.JPEG.raonato2017/1.jpg?type=w800" >
   <h6>&copy Community</h6>
  </div>
  
 </div>

 
</body>
</html>
