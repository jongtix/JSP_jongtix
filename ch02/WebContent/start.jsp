<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 지시자 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1부터 100까지의 합</title>
</head>
<body>
	<% /* 자바코드 부분 시작 스크립틀릿(scriptlet) */
		int total = 0;
		for (int i = 1; i <= 100; i++) {
			total += i;
		}
	%>
	1부터 100까지의 합은 
	<%=total%> <!-- 표현식(expression) : 식의 결과, 값이 옴. -->
</body>
</html>