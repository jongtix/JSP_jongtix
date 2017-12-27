<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="none"%>
<%-- 버퍼가 없을 경우 <jsp:forward> 액션 태그 실행시 오류 발생 가능. --%>
<html>
<head>
<meta charset="UTF-8">
<title>fromNoBuffer.jsp의 제목</title>
</head>
<body>
	이 페이지는 fromNoBuffer.jsp에서 생성한 페이지입니다.
	<jsp:forward page="/to/to.jsp" />
</body>
</html>