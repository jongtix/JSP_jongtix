<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="date" value="<%=new Date()%>" />
<html>
<head>
<title>현재 시간</title>
</head>
<body>
	[S]
	<fmt:formatDate value="${date}" type="both" dateStyle="short"
		timeStyle="short" />
	<br> [M]
	<fmt:formatDate value="${date}" type="both" dateStyle="medium"
		timeStyle="medium" />
	<br> [L]
	<fmt:formatDate value="${date}" type="both" dateStyle="long"
		timeStyle="long" />
	<br> [F]
	<fmt:formatDate value="${date}" type="both" dateStyle="full"
		timeStyle="full" />
</body>
</html>