<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에외 발생</title>
</head>
<body>
	요청처리 과정에서 예외가 발생하였습니다.
	<br> 빠른 시간 내에 문제를 해결하도록 하겠습니다.
	<br>
	<p>
		에러 타입 :
		<%=exception.getClass().getName()%>
		<br>
	<p>
		에러 메시지 : <b><%=exception.getMessage()%></b>
		<!-- 에러 페이지의 크기가 너무 작아서(500kb이하) 자체 에러 페이지를 보여줌 -->
</body>
</html>