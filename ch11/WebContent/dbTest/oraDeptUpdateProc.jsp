<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String driver = application.getInitParameter("driver");
	String url = application.getInitParameter("url");
	String user = application.getInitParameter("user");
	String password = application.getInitParameter("password");

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, password);

	// 수정 작업 변수
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "update dept set dname = ?, loc = ? where deptno = ?";
	String sql2 = "select * from dept where deptno = ?";

	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("dname"));
		pstmt.setString(2, request.getParameter("location"));
		pstmt.setInt(3, Integer.parseInt(request.getParameter("deptno")));

		int result = pstmt.executeUpdate();
		if (result > 0) {
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, Integer.parseInt(request.getParameter("deptno")));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				request.setAttribute("deptno", rs.getInt(1));
				request.setAttribute("dname", rs.getString(2));
				request.setAttribute("loc", rs.getString(3));
			}
		}

		RequestDispatcher dis = request.getRequestDispatcher("oraDeptUpdateResult.jsp");
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