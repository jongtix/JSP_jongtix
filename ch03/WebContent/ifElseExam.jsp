<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 출력</title>
<%!/* 선언부(Declaration) */
	String msg; // 전역변수 선언
	String color;%>
	<%
		String name = request.getParameter("name");
		color = request.getParameter("color");
		if (color.equals("blue")) {
			msg = "파랑";
		} else if (color.equals("red")) {
			msg = "빨강";
		} else if (color.equals("orange")) {
			msg = "오렌지";
		} else {
			msg = "기타";
			color = "white";
		}
	%>
</head>
<body bgcolor=<%=color%>>
	<%=name%>님이 좋아하는 색깔은
	<%=msg%>입니다.

</body>
</html>