<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>익스프레션 언어 연산자 연습</title>
</head>
<body>
	<h1>EL Operations</h1>
	<br> x = ${param.num}, y = ${param.num2}
	<br> x + y = ${param.num + param.num2}
	<br> x - y = ${param.num - param.num2}
	<br> x * y = ${param.num * param.num2}
	<br> x / y = ${param.num / param.num2}
	<br> x % y = ${param.num % param.num2}
	<br> x가 y보다 더 큽니까? ${param.num - param.num2 > 0? "예" : "아니오"}
	<br> y가 x보다 더 큽니까? ${param.num2 - param.num > 0}
	<br> x와 y가 모두 양수입니까? ${(param.num > 0) && (param.num2 > 0)}
	<br> x와 y가 같습니까? ${param.num == param.num2 ? "예" : "아니오"}
	<br>
</body>
</html>