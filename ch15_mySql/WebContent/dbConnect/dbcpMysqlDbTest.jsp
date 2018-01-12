<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Connection conn = null;
	try {
		String envDb = "jdbc/MysqlDB";
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/" + envDb);
		conn = ds.getConnection();
		out.print("<h3>연결성공</h3>");
	} catch (Exception e) {
		out.print("<h3>연결 실패</h3>");
		out.print(e.getMessage());
	}
%>