<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
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
</style>
<script type="text/javascript">
	$(function() {
		$("#writing").click(function() {
			location.href = "${path}/my/write.jsp";
		});
	});
	function list(page) {
		location.href = "${path}/my_servlet/list.do?curPage=" + page + "&tab=funny";
	}
</script>

</head>
<body>
	<div class="container">
		<div style="text-align: right;">
			<c:choose>
				<c:when test="${sessionScope.userid == null}">
					<span style="font-size: 0.9em;"><a
						href="${path}/my_servlet/join.do">회원가입 </a>| </span>
					<span style="font-size: 0.9em;"><a
						href="${path}/my_servlet/login.do">로그인</a></span>
				</c:when>
				<c:otherwise>
					<span style="font-size: 0.9em;"><a
						href="${path}/my_member_servlet/view.do">내정보</a></span>
					<span style="font-size: 0.9em;"><a href="#">내글</a></span>
					<span><strong style="color: blue;">${sessionScope.result}</strong>님
					</span>
					<span style="font-size: 0.9em;"><a
						href="${path}/my_member_servlet/logout.do">로그아웃</a></span>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<hr>
	<div class="container">
		<a href="${path}/my_servlet/list.do?tab=hot"><img width="363px;"
			height="59px;"
			src="https://mblogthumb-phinf.pstatic.net/MjAxODA0MTZfNDMg/MDAxNTIzODY3OTUwMzk5.4RJpbOLIHXySrBRmVvpfpwaBaeoCSol3bmILuFlmjBog.W8N581D-AT6vGa4hwhcuWLKbOCQEGdiGDFnPkgk1E-wg.JPEG.raonato2017/1.jpg?type=w800"></a>
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
		<h2>유머/정보 게시판</h2>
		<table style="width: 100%; text-align: center;">
			<tr style="border-bottom: 2px solid; border-top: 1.5px solid;">
				<th>탭</th>
				<th width="50%">제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회</th>
				<th>추천</th>
			</tr>
			<c:forEach var="dto" items="${list}">
				<tr style="border-bottom: 1px dotted gray;">
					<td>${dto.tab}</td>
					<td><a href="${path}/my_servlet/myview.do?num=${dto.num}">
					${dto.subject}</a>
					<c:if test="${dto.comment_count > 0 }">
					 <span style="color: blue;">[${dto.comment_count}]</span>
					</c:if>
					</td>
					<td>${dto.writer}</td>
					<td><fmt:formatDate value="${dto.reg_date}"
							pattern="yyyy-MM-dd" /></td>
					<td>${dto.readcount}</td>
					<td>${dto.likecount}</td>
				</tr>
			</c:forEach>
			<tr>
				<c:if test="${sessionScope.userid != null }">
					<td colspan="6" align="right"><input type="button" value="글쓰기"
						id="writing"></td>
				</c:if>
			</tr>
			<tr align="center">
				<td colspan="6"><c:if test="${page.curPage > 1}">
						<a href="#" onclick="list('1')">[처음]</a>
					</c:if> <c:if test="${page.curBlock > 1}">
						<a href="#" onclick="list('${page.prevPage}')">[이전]</a>
					</c:if> <c:forEach var="num" begin="${page.blockStart}"
						end="${page.blockEnd}">
						<c:choose>
							<c:when test="${num == page.curPage}">
								<span style="color: red">${num}</span>
							</c:when>
							<c:otherwise>
								<a href="#" onclick="list('${num}')">${num}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach> <c:if test="${page.curBlock < page.totBlock }">
						<a href="#" onclick="list('${page.nextPage}')">[다음]</a>
					</c:if> <c:if test="${page.curPage < page.totPage }">
						<a href="#" onclick="list('${page.totPage}')">[끝]</a>
					</c:if></td>
			</tr>
		</table>
		<hr>
		<div class="container">
			<img id="footerimg" width="300px;" height="59px;"
				src="https://mblogthumb-phinf.pstatic.net/MjAxODA0MTZfNDMg/MDAxNTIzODY3OTUwMzk5.4RJpbOLIHXySrBRmVvpfpwaBaeoCSol3bmILuFlmjBog.W8N581D-AT6vGa4hwhcuWLKbOCQEGdiGDFnPkgk1E-wg.JPEG.raonato2017/1.jpg?type=w800">
			<h6>&copy Community</h6>
		</div>


	</div>
</body>
</html>
