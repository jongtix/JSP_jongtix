<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>${param.name}님이시군요.반갑습니다.<p>
		<c:choose>
			<c:when test="${param.name == 'admin' && param.pass == '1234'}">
당신은 모든 권한을 가지고 있습니다.
</c:when>
			<c:otherwise>
당신은 권한이 없습니다.
</c:otherwise>
		</c:choose>
</body>
</html>