<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<font color="blue" size=5><u>오늘 날짜 출력</u></font>
	<br>
	<%
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	%>
	<%=sdf.format(date)%>
	<p>
		<%
			for (int i = 0; i < 10; i++) {
				out.print(i + " : ");
		%>
		안녕하세요<br>
		<%
			}
		%>
	
</body>
</html>