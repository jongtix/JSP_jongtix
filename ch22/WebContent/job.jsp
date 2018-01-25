<%@page import="java.util.List"%>
<%@page import="dao.EmpDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	EmpDao dao = EmpDao.getInstance();
	List<String> list = dao.selectJob();
	request.setAttribute("list", list);
%>
<html>
<head>
<title></title>
</head>
<body>
	<!-- <form action="Xml1"> -->
	<!-- <form action="Xml2"> -->
	<form action="Json1">
		<select name="job">
			<option value="all">전부</option>
			<c:forEach var="l" items="${list}">
				<c:if test="${!empty list}">
					<option value="${l}">${l}</option>
				</c:if>
			</c:forEach>
		</select> <input type="submit" value="확인">
	</form>
</body>
</html>