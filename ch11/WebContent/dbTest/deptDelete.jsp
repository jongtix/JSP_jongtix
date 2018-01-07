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
	String sql = "select deptno, dname from dept_copy3 order by deptno";

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, password);
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
%>
<h3>부서코드 삭제하기</h3>
<h3>삭제할 부서코드를 선택하세요.</h3>
<form action="deptDeleteProc.jsp">
	<select name="deptno" size="8" multiple="multiple">
		<%
			while (rs.next()) {
		%>
		<option value="<%=rs.getInt(1)%>"><%=rs.getInt(1)%>.<%=rs.getString(2)%>
			<%
				}
			%>
		
	</select> <input type="submit" value="확인">
</form>
<%
	} catch (Exception e) {
	}
	rs.close();
	pstmt.close();
	conn.close();
%>