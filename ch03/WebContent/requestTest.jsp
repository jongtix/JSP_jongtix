<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String hobby = request.getParameter("hobby");

		if (gender.endsWith("m")) {
			gender = "남자";
		} else {
			gender = "여자";
		}
	%>
	<%=name%>님의 정보는 다음과 같습니다.
	<p>
		나이 :
		<%=age%>
	<p>
		성별 :
		<%=gender%>
	<p>
		취미 :
		<%=hobby%>
</body>
</html>