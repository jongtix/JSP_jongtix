<%@page contentType="text/html; charset=UTF-8"%>
<%
	String id="hong";
	String pwd="1234";
	
	/*내장객체인 session객체에 속성저장  */
	session.setAttribute("id", id);
	session.setAttribute("pwd", pwd);
%>
<html>
	<head><title>세션사용 예</title></head>
 <body>
 	<input type="button" value="세션의 설정된 속성 확인"
 	 onclick="javascript:window.location='viewSession.jsp'"> 
</body>
</html>