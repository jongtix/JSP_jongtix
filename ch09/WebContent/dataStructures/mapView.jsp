<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 정보</title>
</head>
<body>
	<!-- 이전 페이지에서 쿼리스트링(?name=park)으로 넘어온 값은 param.name으로 접근 -->
	<!-- map객체의 값을 추출 => map명[param.파라미터명] -->
	${param.name}의 주소는? ${address[param.name]}
	<p>${address.Jesica}
	<p>${address.Susan}
	<p>${address.k1}의 주소는 ${address.v1}
</body>
</html>