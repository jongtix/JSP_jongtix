<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본 객체를 사용하여 자원 읽기(getResourceAsStream)</title>
</head>
<body>
	<%
		/* String resourcePath = "/message/notice.txt"; */
		String resourcePath = application.getInitParameter("notice");
	%>
	자원의 실제 경로 :
	<%=application.getRealPath(resourcePath)%><br>
	<p>
		<%=resourcePath%>의 내용<br>
		<%
			char[] buff = new char[128];
			int len = -1;
			try {
				InputStreamReader reader = new InputStreamReader(application.getResourceAsStream(resourcePath),
						"utf-8");
				while (true) {
					len = reader.read(buff);
					if (len == -1)
						break;
					out.print(new String(buff, 0, len));
				}
				/* while ((len = reader.read(buff)) != -1) {
					out.print(new String(buff, 0, len));
				} */
			} catch (IOException e) {
				pageContext.getOut().print("예외 발생 : " + e.getMessage());
				/* out.print("예외 발생 : " + e.getMessage()); */
			}
		%>
	
</body>
</html>