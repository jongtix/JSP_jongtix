<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String driver = application.getInitParameter("driver");
	String url = application.getInitParameter("url");
	String user = application.getInitParameter("user");
	String password = application.getInitParameter("password");

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, password);

	PreparedStatement pstmt = null;

	String sql_chkId = "select count(*) from member2 where id = ?";

	try {
		pstmt = conn.prepareStatement(sql_chkId);
		pstmt.setString(1, request.getParameter("id"));
		int result = pstmt.executeUpdate();
		if (result > 0) {
			out.print("<script>alert('이미 존재하는 아이디입니다.');window.location.href = 'join.jsp';</script>");
		}
	} catch (Exception e) {
		out.print(e.getMessage());
	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			out.print(e.getMessage());
		}
	}
%>
