<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 쿠키 생성
	Cookie cookie = new Cookie("name", "홍길동");

	//생성된 쿠키 저장(저장소는 브라우저)
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 데이터 저장 프로그램</title>
</head>
<body>쿠키 값이 설정되었습니다.
</body>
</html>