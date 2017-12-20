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
		String number = request.getParameter("number");
		int num = Integer.parseInt(number);
		if (num <= 10) {
	%>
	입력받은 숫자는
	<%=number%>입니다.
	<%
		} else {
	%>
	입력받은 숫자가 10을 초과했습니다.
	<%
		}
	%>

</body>
</html>