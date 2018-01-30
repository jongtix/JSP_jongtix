<%@page import="java.time.YearMonth"%>
<%@page import="java.time.Year"%>
<%@page import="model.DailyCheck"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	try {
		String envDb = "jdbc/OraDB";
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/" + envDb);
		conn = ds.getConnection();
		ResultSet rs = null;

		System.out.println(conn);
		out.print("<h3>연결성공</h3>");
		String qS = "";
		request.setCharacterEncoding("utf-8");

		String year = request.getParameter("year");
		if (year == null)
			Year.now().toString();
		String month = request.getParameter("month");

		if (month == null)
			month = String.format("%02d", YearMonth.now().getMonthValue());
		month = String.format("%02d", Integer.parseInt(month));

		String date = request.getParameter("date");
		System.out.println("date=" + date);
		String id = (String) session.getAttribute("id");
		if (id == null) {
			out.print("<script>");
			out.print("alert('로그인 하세요');");
			out.print("location.href='loginForm.jsp';");
			out.print("</script>");
		}

		String sql = "update dailycheck set d" + date + "=1 where yearmonth=? and id=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, year + month);
		pstmt.setString(2, id);
		int result = pstmt.executeUpdate();
		if (result > 0) {
			out.print("<script>");
			out.print("location.href='calendarInit.jsp'");
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("history.back();");
			out.print("</script>");
		}
	} catch (Exception e) {
		out.print("<h3>연결 실패</h3>");
		out.print(e.getMessage());
	}
%>