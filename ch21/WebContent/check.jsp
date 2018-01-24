<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pass = request.getParameter("password");

		if (id.equals("master") && pass.equals("1234")) {
			session.setAttribute("id", id);
		}
	%>
	<a href="sub2/winner.jsp"><b>결과 보기</b></a>
</body>
</html>