<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Cookie cookie = new Cookie("name", "홍");
	cookie.setMaxAge(60 * 60); // 1 시간
	response.addCookie(cookie);
%>
<html>
<head>
<title>쿠키 유효시간 설정</title>
</head>
<body>
	유효시간 1 시간인 name 쿠키 생성
	<br>
	<a href="deleteCookie.jsp?name=<%=cookie.getName()%>">쿠키를 삭제합니다.</a>
</body>
</html>