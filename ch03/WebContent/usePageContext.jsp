<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageContext 기본객체</title>
</head>
<body>
	<%
		HttpServletRequest httpRequest = (HttpServletRequest) pageContext.getRequest(); // 현재 페이지로 요청하여 온 request 객체의 정보 획득
	%>
	request 기본 객체와 pageContext.getRequest()의 동일성여부 확인 : 
	<%=request == httpRequest%>
	<p>
		pageContext.getOut()메소드를 사용한 데이터 출력 : 
		<%
		pageContext.getOut().print("안녕하세요.");
		// out.print() <= pageContext 객체로부터 얻어낸 out 객체
	%>
	
</body>
</html>