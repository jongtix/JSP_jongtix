<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int number = 10;
	%>
	<!-- 디렉티브에서 선언한 include는 페이지 컴파일 시 포함하여 하나의 페이지로 만들어서 컴파일함 -->
	<%@ include file="/includee.jspf"%>
	공동변수 DATAFOLDER = "<%=dataFolder%>"
</body>
</html>