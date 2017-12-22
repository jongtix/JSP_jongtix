<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%> <!-- 이 페이지에서 오류 발생시 error.jsp에서 오류 처리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E)");
		String strDate = sdf.format(dated); // 의도적 오류
	%>
	일반 jsp페이지의 형태입니다.
	<br> 오늘의 날짜는
	<%=strDate%>
</body>
</html>