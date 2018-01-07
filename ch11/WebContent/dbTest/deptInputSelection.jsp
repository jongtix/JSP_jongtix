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
	String sql = "select deptno, dname from dept";

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, password);
	try {
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
%>
<form action="oraEmp.jsp">
	<select name="deptno">
		<%
			while (rs.next()) {
		%>
		<option value="<%=rs.getInt(1)%>"><%=rs.getInt(1)%>.<%=rs.getString(2)%>
			<%
				}
			%>
		
	</select> <input type="submit" value="전송">
</form>
<%
	rs.close();
		pstmt.close();
		conn.close();
	} catch (Exception e) {
	}
%>