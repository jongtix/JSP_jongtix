<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info="page 내장객체 예제"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String info = this.getServletInfo();
	%>
	<h2>Page 내장객체</h2>
	page디렉티브의 info 속성값 "<%=info%>"를 얻어냄.
</body>
</html>