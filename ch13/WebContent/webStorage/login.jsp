<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>로그인 결과</title>
</head>
<body>
	<h1>메인 페이지</h1>
	<%
		String id = request.getParameter("id");
		out.print(id + "님 환영합니다.<br>");
	%>
	<a href="login.html">로그인 페이지로</a>
</body>
</html>