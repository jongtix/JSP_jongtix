<%@page import="java.util.Date"%>
<%@page import="java.util.TimeZone"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="date" value="<%=new Date()%>" />
<c:forEach var="id" items="<%=TimeZone.getAvailableIDs()%>">
	<fmt:timeZone value="${id}">
		${id} : <fmt:formatDate value="${date}" type="both" />
	</fmt:timeZone>
	<br>
</c:forEach>