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
#form1 {
	float: right;
}

#navbar {
	background-color: #00BFFF;
	height: 35px;
	padding: 0;
}

.ul1 {
	list-style: none;
	display: flex;
	padding: 0px;
	margin: 0px;
}

.li1 {
	padding-right: 1.5em;
	padding-left: 1em;
	margin: 0px;;
}

.li1>a {
	color: white;
}

.li1:hover>a {
	color: yellow;
}

.li1:hover {
	background-color: #00A5FF;
}

a {
	text-decoration: none;
	color: black;
}

#footerimg {
	float: left;
}
#myview1{border-bottom: 1px solid gray; border-top: 1px solid gray;}
#myview1 > * {padding: 0.5em;}
td{padding: 0.5em;}
#commentList > td{border-bottom: 1px solid black; }
#btnLike{border-radius: 0.5em;}
</style>

 <script type="text/javascript">
   $(function(){
	   comment_list(1);
	   if(${sessionScope.userid != null}){
		$("#repleadd").click(function() {
			comment_add();
		});
		$("#btnLike").click(function(){
			location.href="${path}/my_servlet/like.do?num=${dto.num}";
		});
	   }
   });
   
   function comment_add(){
		var param="my_num=${dto.num}&content="+$("#content").val();
		$.ajax({
			type: "post",
			url: "${path}/my_servlet/my_comment_add.do",
			data: param,
			success: function(){
				$("#content").val("");
				comment_list(1);
			}
		});
	}
   
   function comment_list(page){
	   var params = {
			   'num': $('#dtoNum').val(),
// 			   'curPage': (page == undefined) ? 1 : page // 이게 더 좋음
			   'curPage': page //
	   } 
		$.ajax({
			type: "post",
			url: "${path}/my_servlet/my_comment.do",
			data: params,
			success: function(result){
				$("#commentList").html(result);
			}
		});
	}

  </script>
<c:if test="${sessionScope.userid==null }">
  <script type="text/javascript">
   $(function(){
	  $("#repleadd").click(function(){
		  alert("로그인해주세요.");
	  });
	  $("#btnLike").click(function(){
		  alert("로그인후 추천 가능합니다.")
	  })
   });
  </script>
</c:if>



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
  <br>
		<h2>${dto.tab}</h2>
		<input type='hidden' id='dtoNum' value='${dto.num}' />
		<table style="width: 100%; border-bottom: 1px solid;" id="myview">
			<tr id="myview1">
				<th >${dto.subject}</th>
				<td style="text-align: right;"><fmt:formatDate
						value="${dto.reg_date}" pattern="yyyy-MM-dd hh:mm" /></td>
			</tr>
			<tr>
				<td style="width: 80%">닉네임 : ${dto.writer}</td>
				<td>조회수 ${dto.readcount} 추천수 ${dto.likecount }</td>

			</tr>
			<c:if test="${dto.filename != '-'}">
				<tr>
					<td><img style="width: 100%" src="../images/${dto.filename}">
					</td>
				</tr>
			</c:if>
			<tr>
				<td>${dto.content}</td>
			</tr>
			
			<tr>
			 <td colspan="2" align="center">
			 <button type="button" id="btnLike" ><img width="40px" height="30px" src="https://images.chosun.com/resizer/A2Q4sFI6m284SNdJ-AZFASgHnnU=/598x349/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/C6NKSMEXD2Q343DREQHMWJ7RNY.png"> </button>
			 </td>
			</tr>
		
		</table>
		
		 
		
		<div id="commentList"></div>
		<table style="border: 1px solid gray; margin-top: 5px; width: 100%;">
				<tr>
					<td><strong>댓글 쓰기</strong></td>
				</tr>
				<tr>
					<td><textarea id="content" name="content" rows="3" cols="110"
							placeholder="댓글 작성 하시려면 로그인 해주세요"></textarea></td>
					<td style="margin: 0px;"><input name="repleadd" id="repleadd"
						type="button" value="등록" style="height: 5em;"></td>
				</tr>
			</table>
  
  
  
  <hr>
  <div class="container">
   <img id="footerimg" width="300px;" height="59px;" src="https://mblogthumb-phinf.pstatic.net/MjAxODA0MTZfNDMg/MDAxNTIzODY3OTUwMzk5.4RJpbOLIHXySrBRmVvpfpwaBaeoCSol3bmILuFlmjBog.W8N581D-AT6vGa4hwhcuWLKbOCQEGdiGDFnPkgk1E-wg.JPEG.raonato2017/1.jpg?type=w800" >
   <h6>&copy Community</h6>
  </div>
  
  
 </div>
</body>
</html>

