<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	List<Member> list = new ArrayList<>();
	MemberDao dao = MemberDao.getInstance();
	list = dao.selectMemberAll();
	request.setAttribute("list", list);
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h2>회원정보</h2>
	<table border=1 bgcolor="yellow">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>등록일</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan=3>데이타가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list}">
			<c:forEach var="emp" items="${list}">
				<tr>
					<td><a href="view.jsp?id=${emp.id}">${emp.id}</a></td>
					<td>${emp.name}</td>
					<td>${emp.reg_date}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>