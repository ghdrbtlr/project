<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Util" %>
<%@ page import="java.util.Date" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>counter.jsp</title>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%
String count=Util.getCookie(request.getCookies(), "count");
int intCount=0;

//방문시간 저장
Date date=new Date();//날짜 객체 생성
long now_time=date.getTime();//현재 시각

String visitTime=Util.getCookie(request.getCookies(), "visit_time");
long visit_time=0;


if (visitTime !=null && !visitTime.equals("")){
	visit_time=Long.parseLong(visitTime);
}

out.print("현재시각 : "+now_time+"<br>");
out.print("방문시각 : "+visit_time+"<br>");


if(count==null || count.equals("")){//첫 방문일 경우
  //쿠키변수 생성
  response.addCookie(new Cookie("count", "1"));
  //첫 방문시간 저장
  response.addCookie(new Cookie("visit_time",Long.toString(now_time)));
}else{//재방문일 경우
  //방문시간 변경
  long period = now_time - visit_time; //방문시간=현재시각-방문시각
  intCount = Integer.parseInt(count)+1;
  if(period > 3*1000){//일정시간(3초)이 경과하면 카운터 수정
    //(period > 24*60*60*1000) : 하루(24시간)에 한번만 카운팅되게..
      //카운터값 변경
      response.addCookie(
          new Cookie("count", Integer.toString(intCount)));
      //방문시간 업데이트
      response.addCookie(
          new Cookie("visit_time", Long.toString(now_time)));
  }
}

//Integer.toString(숫자) : 숫자를 문자열로
String counter=Integer.toString(intCount);
for(int i=0; i<counter.length(); i++){
  //문자열.charAt(인덱스) 문자열의 n번째 문자 리턴
  //ex) 0.gif, 1.gif, 2.gif....
 String img="<img src='../images/"+counter.charAt(i)+".gif'>";
 out.println(img);
}
%>

<!-- <img  src="../images/0.gif"> -->
<%-- 방문횟수 : <%= intCount %> --%>

<!-- 실행시 F5(새로고침) 카운팅  -->

</body>
</html>
