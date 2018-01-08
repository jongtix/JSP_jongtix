<%@page import="util.CookieBox"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	response.addCookie(CookieBox.createCookie("name", "홍길동"));
%>
쿠키저장 성공<p>
<a href="cookieBoxView.jsp">쿠키보기</a>