<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String name = request.getParameter("name");
	Cookie[] cookies = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals(name)) {
				// cookies[i].setValue("");
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
				/* Cookie cookie = new Cookie(name, ""); // 쿠키명에 해당하는 값 삭제
				cookie.setMaxAge(0); // 쿠키 삭제 처리
				response.addCookie(cookie); */
			}
		}
	}
%>
<html>
<head>
<title>쿠키 삭제</title>
</head>
<body><%=name%>쿠키가 삭제 되었습니다.
</body>
</html>