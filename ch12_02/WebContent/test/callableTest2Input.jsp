<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Types"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Connection conn = null;
	String sql = "select id from member2 order by id";
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OraDB");
		conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = null;
		rs = pstmt.executeQuery();
%>
<form action="callableTest2.jsp">
	<select name="id">
		<%
			while (rs.next()) {
		%>
		<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
		<%
			}
		%>
	</select> <input type="submit" valur="전송">
</form>
<%
	conn.close();
	} catch (Exception e) {
		out.print(e.getMessage());
	}
%>