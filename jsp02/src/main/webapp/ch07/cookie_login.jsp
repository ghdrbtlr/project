<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie_login</title>
<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	//팝업창 열기
	//window.open(url,id,option);
	//팝업창 열기 옵션값을 가져옴
	var show = getCookie("showCookies");
	if (show != "N"){
		window.open("popup.jsp", "", "width=300,height=400");
	}
	//저장된 쿠키 조회
	var cookie_userid = getCookie("userid");
	//저장된 쿠키가 있으면
	if (cookie_userid != "") {
			//userid 태그에 쿠키값을 입력
			$("#userid").val(cookie_userid);
			//체크박스를 체크상태로 설정 
			$("#chkSave").attr("checked", true);
		}
	
	//로그인 버튼 클릭
	$("#btnLogin").click(function() {
			if ($("#chkSave").is(":checked")) { //check
				saveCookie($("#userid").val());
			} else { //uncheck
				saveCookie("");
			}
		});
	
	//쿠키삭제 버튼 클릭
	$("#btnDelete").click(function(){
		    location.href="deleteCookie.jsp";
  });

	
	//아이디 저장 클릭
	$("#chkSave").click(function() {
		if ($("#chkSave").is(":checked")) {
			if (!confirm("로그인 정보를 저장하시겠습니까?")) {
				$("#chkSave").prop("checked", false);
			}
		}
	});
});//end $(function(){
	
function saveCookie(id) {
	if(id != ""){
	 setCookie("userid", id, 7);//7일	
	}else {
		setCookie("userid", id, -1);//삭제
	}
}

//setCookie(쿠키변수명, 쿠키값, 유효날짜)
function setCookie(name, value, days){
	var today = new Date();//날짜 객체
	//쿠키의 유효시간 설정
	today.setDate(today.getDate() + days);
	//쿠키변수명=쿠키값;path=저장경로;expires=만료일자
	document.cookie = name + "=" + value 
	+ ";path=/jsp02;expires="
		+ today.toGMTString() + ";";

	}
	
//저장된 쿠키를 검사하는 함수
function getCookie(cname) {
	var cookie = document.cookie + ";";
	console.log(cookie);
	var idx = cookie.indexOf(cname, 0);
	var val = "";
	if (idx != -1) {
		console.log(idx + "," + cookie.length);
		// substring( start, length )
		cookie = cookie.substring(idx, cookie.length);
		begin = cookie.indexOf("=", 0) + 1;
		end = cookie.indexOf(";", begin);
		console.log(begin + "," + end);
		// substring(start,end) start ~ end-1
		val = cookie.substring(begin, end);
	}
	return val;
}

</script>

</head>
<body>
<form method="post" name="form1">
 <table border="1">
  <tr>
   <td>아이디</td>
   <td><input name="userid" id="userid">
       <input type="checkbox" id="chkSave">아이디 저장</td>
  </tr>
  <tr>
   <td>비밀번호</td>
   <td><input type="password" name="passwd"></td>
  </tr>
  <tr>
   <td colspan="2" align="center">
    <input type="button" value="로그인" id="btnLogin">
    <input type="button" value="쿠키삭제" id="btnDelete">
   </td>
  </tr>
 </table>
</form>

</body>
</html>
