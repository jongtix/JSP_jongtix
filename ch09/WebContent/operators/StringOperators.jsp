<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문자열비교</title>
</head>
<body>
	<br>입력 문자열 : ${param.str1}, ${param.str2}
	<br>두 문자열이 같습니까? ${param.str1 == param.str2}<!-- EL에서는 문자열 비교를 동등 연산자(==)로 비교 -->
	<br>어느 문자열이 먼저입니까? ${param.str1 < param.str2 ? param.str1 : param.str2}
</body>
</html>