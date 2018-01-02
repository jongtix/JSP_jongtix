<%@page import="model.Dept"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
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

	// 수정 작업 변수
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "delete dept_copy3 where deptno in(";
	String sql2 = "select * from dept_copy3 order by deptno";

	String[] deptno = request.getParameterValues("deptno");
	List<Dept> list = new ArrayList<Dept>();
	for (int i = 0; i < deptno.length; i++) {
		if (i == (deptno.length - 1)) {
			sql += deptno[i] + ")";
		} else {
			sql += deptno[i] + ", ";
		}
	}

	try {
		stmt = conn.createStatement();
		int result = stmt.executeUpdate(sql);

		if (result > 0) {
			rs = stmt.executeQuery(sql2);
			while (rs.next()) {
				int i = 0;
				Dept dept = new Dept(rs.getInt(++i), rs.getString(++i), rs.getString(++i));
				list.add(dept);
			}
		}

		request.setAttribute("list", list);

		RequestDispatcher dis = request.getRequestDispatcher("oraDeptDeleteResult.jsp");
		dis.forward(request, response);
	} catch (Exception e) {
		out.print(e.getMessage());
	} finally {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
			out.print(ex.getMessage());
		}
	}
%>