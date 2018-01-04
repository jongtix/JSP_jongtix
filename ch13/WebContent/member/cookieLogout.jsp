<%@page contentType="text/html; charset=UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("id")) {
				cookies[i].setMaxAge(0);//쿠키의 유효기간 0으로 처리
				response.addCookie(cookies[i]);
			}
		}
	}
%>
<script>
	alert("로그아웃되었습니다.");
	location.href = "cookieMain.jsp";
</script>
