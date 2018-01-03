<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Connection conn = null;
	String sql = "select * from member2 order by id";

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OraDB");
		conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,
		ResultSet.CONCUR_UPDATABLE);
		ResultSet rs = pstmt.executeQuery();
		rs.first(); // 커서의 처음으로 이동
		out.print("첫 번째 행 : " + rs.getString(1) + ", " + rs.getString(3) + ",<br>");
		rs.absolute(3); // 커서의 특정 행으로 이동
		out.print("세 번째 행 : " + rs.getString(1) + ", " + rs.getString(3) + ",<br>");
		rs.last(); // 커서의 마지막으로 이동
		out.print("마지막 행 : " + rs.getString(1) + ", " + rs.getString(3) + ",<br>");
	} catch (Exception e) {
		out.print("<h3>데이터 가져오기 실패</h3>");
		e.printStackTrace();
	}
%>