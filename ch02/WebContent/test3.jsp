<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1부터 200까지 합 출력</title>
</head>
<body>
	<%
		int total = 0;
		for (int i = 1; i <= 100; i++) {
			total += i;
		}
	%>
	1부터 100까지의 합은
	<%=total%><br>
	<%
		for (int i = 101; i <= 200; i++) {
			total += i;
		}
	%>
	1부터 200까지의 합은
	<%=total%>
</body>
</html>