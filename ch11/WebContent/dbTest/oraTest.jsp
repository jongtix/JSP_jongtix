<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>데이터베이스 연결 확인하기</title>
</head>
<body>
	<h3>데이터베이스 연결 테스트</h3>
	<%
		String driver = application.getInitParameter("driver");
		String url = application.getInitParameter("url");
		String user = application.getInitParameter("user");
		String password = application.getInitParameter("password");
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, user, password);
		if (conn != null) {
			out.print("webdb 데이터베이스로 연결했습니다.");
		} else {
			out.print("webdb 데이터베이스로 연결을 할 수 없습니다.");
		}
		conn.close();
	%>
</body>
</html>