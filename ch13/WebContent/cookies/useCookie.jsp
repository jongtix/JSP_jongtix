<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>웹 브라우저에 저장된 쿠키를 가져오기</title>
</head>
<body>
	<h2>웹 브라우저 쿠키 출력</h2>
	<%
		// 쿠키 저장 객체 생성
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			out.print("쿠키의 갯수 : " + cookies.length + "<br>");
			for (int i = 0; i < cookies.length; i++) {
				out.print("쿠키의 이름은 " + cookies[i].getName() + "이고<br>");
				out.print("쿠키의 값은 " + cookies[i].getValue() + "입니다.<br>");
			}
		}
	%>
</body>
</html>