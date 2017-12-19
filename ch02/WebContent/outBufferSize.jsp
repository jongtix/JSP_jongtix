<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page buffer="4kb"%> <!-- 버퍼 사이즈가 none이면 버퍼를 통하지 않고 바로 출력 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>출력 버퍼의 크기 지정</title>
</head>
<body>
	출력 버퍼의 크기 :
	<%=out.getBufferSize()%>바이트
</body>
</html>