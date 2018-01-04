<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 특정 경로 접근 쿠키
	Cookie cookie1 = new Cookie("path1", "경로:/ch13/path1");
	cookie1.setPath("/ch13/path1");/* url내의 특정 uri */
	response.addCookie(cookie1);

	Cookie cookie2 = new Cookie("path2", "경로:");
	response.addCookie(cookie2);

	Cookie cookie3 = new Cookie("path3", "경로:/");
	cookie3.setPath("/");
	response.addCookie(cookie3);

	Cookie cookie4 = new Cookie("path1", "경로:/ch13/path2");
	cookie4.setPath("/ch13/path2");
	response.addCookie(cookie4);

	/* value에 띄어쓰기 불가능 */
%>
<html>
<head>
<title>쿠키 경로 설정</title>
</head>
<%=cookie1.getName()%>
=
<%=cookie1.getValue()%>
[<%=cookie1.getPath()%>]
<br>
<%=cookie2.getName()%>
=
<%=cookie2.getValue()%>
[<%=cookie2.getPath()%>]
<br>
<%=cookie3.getName()%>
=
<%=cookie3.getValue()%>
[<%=cookie3.getPath()%>]
<br>
<%=cookie4.getName()%>
=
<%=cookie4.getValue()%>
[<%=cookie4.getPath()%>]
<br>
<a href="viewCookies.jsp">쿠키 목록</a>
</html>