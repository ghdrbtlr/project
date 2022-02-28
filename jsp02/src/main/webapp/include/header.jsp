<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
1)JSTL(Jsp Standard Tag Library, JSP 표준 태그 라이브러리)
2)JSTL 사용 이유 : model1은 jsp페이지중심,  model2는 java코드(서블릿,모델)중심
jsp웹페이지에서 java코드를 안쓸 수는 없지만 이를 최소화 하기 위해 JSTL과 EL기법을 씀,
즉, jsp 내부의 자바코드를 대체하기 위한 태그
3) taglib prefix="태그 접두어" uri="태그라이브러리의 식별자"
4) Core tag(핵심태그, 제일 자주 사용되는 태그들)
-->    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 위 코드를 많이 쓰게되어 header에 넣고 include시킴 -->

<script src="../include/jquery-3.6.0.min.js"></script>
<script src="${path}/include/js/bootstrap.js"></script>
<link rel="stylesheet" href="${path}/include/css/bootstrap.css">

