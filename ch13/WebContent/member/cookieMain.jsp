<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = "";
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("id")) {
				id = cookies[i].getValue();
			}
		}
		if (id.equals("")) {
			response.sendRedirect("loginForm.jsp");
		}
	} else {
		response.sendRedirect("loginForm.jsp");
	}
%>
<html>
<head>
<title>쿠키를 이용한 사용자 인증</title>
</head>
<body>
	<b><%=id%></b>님이 로그인하셨습니다.
	<form action="cookieLogout.jsp" method="post">
		<input type="submit" value="로그아웃">
	</form>
</body>
</html>