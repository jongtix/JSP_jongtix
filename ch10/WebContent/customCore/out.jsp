<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML 문법 설명</title>
</head>
<body>
	<h3>font 태그</h3>
	<c:out value="<font size=7>커다란 글씨</font>는 다음과 같이 출력을 합니다." />
	<br>
	<br>
	<c:out value="<font size=7>커다란 글씨</font>" escapeXml="false" />
	<br>
	<br> 안녕하세요
	<c:out value="${param.id}" default="guest" />
	님
</body>
</html>