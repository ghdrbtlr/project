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
<table id="commentList" style="width: 100%">
 <tr align="center" style="background-color: #00BFFF;">
  <td colspan="2"><strong>[댓 글 목 록]</strong> </td>
 </tr>

			<c:forEach var="row" items="${list2}">
				<c:choose>
					<c:when test="${row.show == 'y'}">
						<tr style="border-top: 1px solid black;">
							<td ><strong>${row.writer}</strong> </td>
							<td><fmt:formatDate value="${row.reg_date }"
									pattern="yyyy-MM-dd hh:mm:ss" /></td> 
						</tr>
						<tr style="border-bottom: 1px solid black;">
						<td>${row.content }</td>
						</tr>

					</c:when>
					<c:otherwise>
						<tr>
							<td>[삭제된 댓글입니다.]</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<tr align="center">
				<td colspan="2"><c:if test="${page.curPage > 1}">
						<a href="#" onclick="comment_list('1')">[처음]</a><!--여기 온클릭을 다바까야대지? 됫지 근데맞나이거 -->
					</c:if> <c:if test="${page.curBlock > 1}">
						<a href="#" onclick="comment_list'${page.prevPage}')">[이전]</a>
					</c:if> <c:forEach var="num" begin="${page.blockStart}"
						end="${page.blockEnd}">
						<c:choose>
							<c:when test="${num == page.curPage}">
								<span style="color: red">${num}</span>
							</c:when>
							<c:otherwise>
								<a href="#" onclick="comment_list('${num}')">${num}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach> <c:if test="${page.curBlock < page.totBlock }">
						<a href="#" onclick="comment_list('${page.nextPage}')">[다음]</a>
					</c:if> <c:if test="${page.curPage < page.totPage }">
						<a href="#" onclick="comment_list('${page.totPage}')">[끝]</a>
					</c:if></td>
			</tr>
		</table>
		
<script type="text/javascript">


</script>
</body>
</html>
