<%@page contentType="text/html; charset=UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
<html><body>
메인페이지 입니다.<br>
${id}님 환영합니다.<br>

<a href="sessionLogOut.jsp">로그아웃</a>
</body></html>