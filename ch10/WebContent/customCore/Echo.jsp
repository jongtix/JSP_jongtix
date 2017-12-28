<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>메아리 jstl 반복문</title>
</head>
<body>
	<c:forEach begin="1" end="5" var="cnt">
		<font size=${cnt}>야~ 호~</font>
		<br>
	</c:forEach>
</body>
</html>