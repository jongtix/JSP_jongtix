<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>쿠키 목록</title>
</head>
<body>
	<h3>쿠키 목록</h3>
	<%
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
	%>
	<%=cookies[i].getName()%>
	=
	<%=cookies[1]%><br>
	<%
		}
		} else {
	%>
	쿠키가 존재하지 않습니다.
	<%
		}
	%>
</body>
</html>