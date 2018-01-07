<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="resource.message_en" var="message" />
<fmt:message bundle="${message}" key="TITLE" var="title" />
<html>
<head>
<title>${title}</title>
</head>
<body>
	<fmt:message bundle="${message}" key="GREETING" />
	<br>
	<c:if test="${!empty param.id}">
		<fmt:message bundle="${message}" key="VISITOR">
			<fmt:param value="${param.id}" />
		</fmt:message>
	</c:if>
</body>
</html>
