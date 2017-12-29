<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="date" value="<%=new Date()%>" />
<html>
<head>
<title>현재 시간</title>
</head>
<body>
	[오늘 날짜]
	<fmt:formatDate value="${date}" />
	<br> [현재 시간]
	<fmt:formatDate value="${date}" type="time" />
</body>
</html>