<%@page import="util.CookieBox"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	response.addCookie(CookieBox.createCookie("name", "홍길동"));
%>
쿠키 저장 성공
<p>
	<a href="cookieBoxView.jsp">쿠키 보기</a>