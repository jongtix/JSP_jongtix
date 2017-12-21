<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외 발생</title>
</head>
<body>
	<!-- 출력할 내용의 크기는 500Byte가 넘어야 함. -->
	요청 처리 과정에 문제가 발생하였습니다.
	<p>
		에러 타입 :
		<%=exception.getClass().getName()%><br>
</body>
</html>