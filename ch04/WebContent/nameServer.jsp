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
		String str = request.getParameter("name");
		String str2 = null;
		out.print(str2);
	%>
	<%=str.toUpperCase()%>
	<%=str2.toUpperCase()%>
</body>
</html>