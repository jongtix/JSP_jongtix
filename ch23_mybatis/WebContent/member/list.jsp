<%@page import="dto.Member"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>회원 리스트</title>
</head>
<body>
	<input type="button" value="회원가입" onclick="location.href='joinForm.do'">
	<table border=1 bgcolor="yellow">
		<caption>
			<h3>회원 리스트</h3>
		</caption>
		<tr>
			<th><b>순번</b></th>
			<th><b>아이디</b></th>
			<th><b>회원명</b></th>
			<th><b>가입일자</b></th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan=4><b>정보가 없습니다.</b></td>
			</tr>
		</c:if>
		<c:if test="${!empty list}">
			<c:forEach var="m" items="${list}" varStatus="n">
				<tr>
					<td><b>${n.count}</b></td>
					<td><a href="view.do?id=${m.id}"><b>${m.id}</b></a></td>
					<td><b>${m.name}</b></td>
					<td><b>${m.reg_date}</b></td>
				</tr>
			</c:forEach>
		</c:if>
</body>
</html>