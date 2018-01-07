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
	String deptno = request.getParameter("deptno");
	String sql = "select * from dept where deptno = ?";

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, password);

	try {
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(deptno));
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			/* out.print("서정보 : " + rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3)); */
			request.setAttribute("deptno", rs.getInt(1));
			request.setAttribute("dname", rs.getString(2));
			request.setAttribute("location", rs.getString(3));
		} else {
			out.print("해당 부서는 존제하지 않습니다.");
		}
		rs.close();
		pstmt.close();
		conn.close();
		RequestDispatcher dis = request.getRequestDispatcher("oraTestView.jsp");
		dis.forward(request, response);
	} catch (Exception e) {
	}
%>