<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="date" value="<%=new Date()%>" />
<html>
<body>
	서울 :
	<fmt:formatDate value="${date}" type="both" />
	<br>
	<fmt:timeZone value="Asia/Hong_Kong">
	홍콩 : <fmt:formatDate value="${date}" type="both" />
	</fmt:timeZone>
	<br>
	<fmt:timeZone value="Europe/London">
	런던 : <fmt:formatDate value="${date}" type="both" />
	</fmt:timeZone>
	<br>
	<fmt:timeZone value="America/New_York">
	뉴욕 : <fmt:formatDate value="${date}" type="both" />
	</fmt:timeZone>
</body>
</html>