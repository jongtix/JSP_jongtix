<%@page import="util.DateUtil"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		Date date = new Date();
	%>
	오늘의 날짜는
	<%=DateUtil.format(date)%>
</body>
</html>