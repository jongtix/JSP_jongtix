<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>날짜와 시간</title>
</head>
<body>
	<%
		GregorianCalendar now = new GregorianCalendar();
		String date = String.format("%TF", now);
		String time = String.format("%TT", now);
	%>
	오늘의 날짜 :
	<%=date%><br> 현재 시간 :
	<%=time%>
</body>
</html>