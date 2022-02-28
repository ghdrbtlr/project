<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!-- cos.jar -->
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<%
//파일업로드를 위한 디렉토리 설정,
//윈도우즈 c:\\, 유닉스(리눅스) c:/ 
//(참고:유닉스(리눅스)는 드라이버(c,d..) 개념이 없고 디렉토리개념만 있다.
String upload_path="c:\\upload";
//파일 업로드 최대 사이즈 설정
int size=10*1024*1024; //byte단위(10MB)
String name="";
String subject="";
String filename="", filename2="";
int filesize=0, filesize2=0;
try{
  //MultipartRequest : request를 확장한 객체
  //MultipartRequest(request,"업로드 디렉토리",제한용량,
  //        "인코딩방식",파일명중복방지처리옵션)
  MultipartRequest multi=
      new MultipartRequest(request,upload_path,size,
          "utf-8",new DefaultFileRenamePolicy());
  name=multi.getParameter("name");//request.getParameter와 같음
  subject=multi.getParameter("subject");
  Enumeration files=multi.getFileNames();//파일이름을 가져옴
  String file1=(String)files.nextElement();//클라이언트 파일네임1
  String file2=(String)files.nextElement();//클라이언트 파일네임2
  
  filename=multi.getFilesystemName(file1);//서버에 업로드된 파일 이름
  File f1=multi.getFile(file1);//File : 파일의 정보를 참조
  filesize=(int)f1.length();//파일의 사이즈(정수로 표현)
  
  filename2=multi.getFilesystemName(file2);//서버에 업로드된 파일 이름
  File f2=multi.getFile(file2);//File : 파일의 정보를 참조
  filesize2=(int)f2.length();//파일의 사이즈(정수로 표현)
}catch(Exception e){
 e.printStackTrace(); 
}
%>
이름 : <%= name %> <br>
제목 : <%= subject %> <br>
파일1 이름 : <%= filename2 %> <br>
파일1 크기 : <%= filesize2 %> <br>
파일2 이름 : <%= filename %> <br>
파일2 크기 : <%= filesize %> <br>

</body>
</html>
