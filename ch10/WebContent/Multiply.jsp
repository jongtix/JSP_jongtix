<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- custom tag 라이브러리 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 커스텀 택을 사용한 변수 선언 -->
<c:set var="num1" value="7" />
<c:set var="num2" value="9" />
<c:set var="result" value="${num1 * num2}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>곱셈 결과</title>
</head>
<body>${num1}과 ${num2}의 곱셈 결과는 ${result}
</body>
</html>