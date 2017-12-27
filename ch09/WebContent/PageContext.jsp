<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageContext 내장객체</title>
</head>
<body>
	<h1>PageContext 내장객체 사용하기</h1>
	요청 URI : ${pageContext.request.requestURI}
	<br> 요청 URL : ${pageContext.request.requestURL}
	<br>
</body>
</html>