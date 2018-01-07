<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setAttribute("name", "홍길동");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Object</title>
</head>
<body>
	<!-- web.xml에서 oldversion 폴더의 EL기능을 정지시켜서 실행 안 됨 -->
	요청 URI : ${pageContext.request.requestURI}
	<br> request의 name 속성 : ${requestScope.name}
	<br> code 파라미터 : ${param.code}
</body>
</html>