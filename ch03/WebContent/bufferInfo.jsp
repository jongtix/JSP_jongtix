<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page buffer="8kb" autoFlush="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버퍼 정보</title>
</head>
<body>
	<p>
		버퍼 크기 :
		<%=out.getBufferSize()%>
	<p>
		남은 버퍼 :
		<%=out.getRemaining()%>
	<p>
		사용 버퍼 :
		<%=out.getBufferSize() - out.getRemaining()%>
	<p>
		autoFlush :
		<%=out.isAutoFlush()%>
</body>
</html>