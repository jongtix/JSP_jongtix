<%@page import="java.sql.ResultSet"%>
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

	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		sql = "select * from dept where deptno = ?";
		int deptno = Integer.parseInt(request.getParameter("deptno"));
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, deptno);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			request.setAttribute("deptno", rs.getInt(1));
			request.setAttribute("dname", rs.getString(2));
			request.setAttribute("location", rs.getString(3));
		}
		RequestDispatcher dis = request.getRequestDispatcher("empInfoView.jsp");
		dis.forward(request, response);
	} catch (Exception e) {
		out.print(e.getMessage());
	} finally {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
			out.print(ex.getMessage());
		}
	}
%>