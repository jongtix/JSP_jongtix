<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>현재 시간</title>
</head>
<body>
	<%
		Calendar cal = (Calendar) request.getAttribute("time"); /* getAttribute()의 속성은 Object */
	%>
	현재 시간은
	<%=cal.get(Calendar.HOUR_OF_DAY)%>시
	<%=cal.get(Calendar.MINUTE)%>분
	<%=cal.get(Calendar.SECOND)%>초입니다.
</body>
</html>