<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String value = request.getParameter("value");
		if (name != null && value != null) {
			application.setAttribute(name, value);
		}
	%>

	<%
		if ((name != null && value != null) && !(name.equals("") && value.equals(""))) {
	%>
	application 기본객체의 속성 설정 :
	<%=name%>
	=
	<%=value%>
	<%
		} else {
	%>
	name과 value가 null값입니다.
	<br> application 기본 객체 속성 설정 안함.
	<%
		}
	%>
</body>
</html>