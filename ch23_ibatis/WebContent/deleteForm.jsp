<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	request.setAttribute("id", id);
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="deletePro.jsp">
		<input type="hidden" name="id" value="${id}"> <input
			type="password" name="password" required>
		<p>
			<input type="submit" value="확인">
		<p>
	</form>
</body>
</html>