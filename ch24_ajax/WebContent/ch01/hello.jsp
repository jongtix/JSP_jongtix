<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>hello.html의 ajax데이터 응답</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
%>
<body>
	와우! 반갑습니다.
	<%=name%>님
</body>
</html>