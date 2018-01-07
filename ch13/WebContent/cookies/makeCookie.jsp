<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>쿠키 생성하기</title>
</head>
<%
	String cookieName = "id"; // 키
	String cookieValue = "hong"; // 값
	// 쿠키 객체 생성(서버에서 생성)
	Cookie cookie = new Cookie(cookieName, cookieValue);
	cookie.setMaxAge(60 * 2); // 60초 * 2
	cookie.setValue("kim"); // 쿠키값 변경
	// 쿠키 객체 전송
	response.addCookie(cookie);
%>
<body>
	<h2>쿠키를 생성하는 예</h2>
	<p>
		"<%=cookieName%>"쿠키가 생성되었습니다.<br> <input type="button"
			value="쿠키 내용 확인" onclick="javascript:window.location='useCookie.jsp'">
	</p>
</body>
</html>