<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = request.getParameter("name");
	String[] movies = request.getParameterValues("movie");
	out.print("이름: " + name + "<br>");
	for (String m : movies) {
		out.print(m + "<br>");
	}
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="m" items="${movies}">
	${m}<br>
	</c:forEach>
</body>
</html>