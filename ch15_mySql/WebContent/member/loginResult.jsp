<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	String password = (String) session.getAttribute("password");

	if (id == null || id.equals("")) {
		response.sendRedirect("loginform.html");
	}
%>
<h2>${id}님환영합니다.</h2>
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
<p>
	<input type="button" value="정보 수정"
		onclick="location.href='memberUpdateForm.jsp?id=${id}'">
<p>
	<input type="button" value="회원탈퇴"
		onclick="location.href='deleteForm.jsp'">
<p>
	<input type="button" value="회원리스트"
		onclick="location.href='memberList.jsp'">
<p>