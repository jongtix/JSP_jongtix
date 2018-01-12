<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDao1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");

	if (id == null || id.equals("")) {
		out.print("<script>alert('먼저 로그인해주세요.');location.href='loginForm.html';</script>");
	} else {
		MemberDao1 dao = new MemberDao1();
		List<Member> list = dao.getMemberList();
		request.setAttribute("list", list);
	}
%>
<!-- 회원리스트 출력 : id, name, birth, email, regdate -->
<c:if test="${empty list}">회원 리스트가 없습니다.</c:if>
<c:if test="${!empty list}">
	<table border="1" bgcolor="yellow">
		<caption>회원리스트</caption>
		<tr>
			<td>번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>생일</td>
			<td>이메일</td>
			<td>가입일자</td>
		</tr>
		<c:forEach var="l" items="${list}">
			<tr>
				<td>${status.count}</td>
				<td><a href="memberUpdateForm.jsp?id=${l.id}">${l.id}</a></td>
				<td>${l.name}</td>
				<td>${l.birth}</td>
				<td>${l.email}</td>
				<td>${l.regdate}</td>
			</tr>
		</c:forEach>
	</table>
</c:if>