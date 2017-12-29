<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="date" value="<%=new Date()%>" />
<html>
<head>
<title>세계 시간 프로그램</title>
</head>
<body>
	서울 :
	<fmt:setTimeZone value="Asia/Seoul" />
	<fmt:formatDate value="${date}" type="both" />
	<br> 홍콩 :
	<fmt:setTimeZone value="Asia/Hong_Kong" />
	<fmt:formatDate value="${date}" type="both" />
	<br> 런던 :
	<fmt:setTimeZone value="Europe/London" />
	<fmt:formatDate value="${date}" type="both" />
	<br> 뉴욕 :
	<fmt:setTimeZone value="America/New_York" />
	<fmt:formatDate value="${date}" type="both" />
</body>
</html>