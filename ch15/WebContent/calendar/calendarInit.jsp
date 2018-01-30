<%@page import="java.time.Year"%>
<%@page import="java.time.YearMonth"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="model.DailyCheck"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%><%@page
	import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%><%@page
	import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%><%@ page
	contentType="text/html; charset=UTF-8"%>
<%
	Connection conn = null;
	try {
		String envDb = "jdbc/OraDB";
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/" + envDb);
		conn = ds.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qS = "";

		request.setCharacterEncoding("utf-8");

		String year = request.getParameter("year");
		if (year == null)
			year = Year.now().toString();
		String month = request.getParameter("month");

		if (month == null)
			month = String.format("%02d", YearMonth.now().getMonthValue());
		month = String.format("%02d", Integer.parseInt(month));

		String id = (String) session.getAttribute("id");

		if (id == null) {
			out.print("<script>");
			out.print("alert('로그인 하세요');");
			out.print("location.href='loginForm.jsp';");
			out.print("</script>");
		}
		pstmt = conn.prepareStatement("select yearmonth from dailycheck where id=? and yearmonth=?");
		pstmt.setString(1, id);
		pstmt.setString(2, year + month);
		rs = pstmt.executeQuery();
		if (!rs.next()) {
			pstmt = conn.prepareStatement("insert into dailycheck(id,yearmonth) values(?,?)");
			pstmt.setString(1, id);
			pstmt.setString(2, year + month);
			pstmt.executeUpdate();
		}

		System.out.println("id=" + id);
		System.out.println("year=" + year);
		System.out.println("month=" + month);
		qS = "id=" + id + "&yearmonth=" + year + month + "&";
		pstmt = conn.prepareStatement("select * from dailycheck where id=? and yearmonth=?");
		pstmt.setString(1, id);
		pstmt.setString(2, year + month);
		rs = pstmt.executeQuery();
		ResultSetMetaData rm = rs.getMetaData();
		System.out.println(rm.getColumnCount());
		if (rs.next()) {
			System.out.println("x");
			for (int i = 3; i <= rm.getColumnCount(); i++) {
				if (i == rm.getColumnCount()) {
					qS += "D" + (i - 2) + "=" + rs.getInt(i);
					System.out.println("qS=" + qS);
				} else {
					qS += "D" + (i - 2) + "=" + rs.getInt(i) + "&";
					System.out.println("qS=" + qS);
				}
			}
		}
		System.out.println(qS);
		out.println("<script>");
		out.println("location.href='calendar.html?" + qS + "'");
		out.println("</script>");
	} catch (Exception e) {
		out.print("<h3>연결 실패</h3>");
		out.print(e.getMessage());
	}
%>