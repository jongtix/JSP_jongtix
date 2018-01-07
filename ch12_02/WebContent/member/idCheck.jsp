<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	Connection conn = null;

	PreparedStatement pstmt = null;
	String sql = "select count(*) from member2 where id=?";
	ResultSet rs = null;
	//파라미터 받기
	String id = request.getParameter("id");

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OraDB");
		conn = ds.getConnection();

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);

		rs = pstmt.executeQuery();
		if (rs.next()) {
			if (rs.getInt(1) == 0) {
				out.print("<script>");
				out.print("alert('사용할수 있는 id입니다.');");
				out.print("window.opener.frm.password.focus();");
				out.print("window.self.close();");
				out.print("</script>");
			} else {
				out.print("<script>");
				out.print("alert('사용할수 없는 id입니다.');");
				out.print("window.opener.frm.id.value='';");
				out.print("window.opener.frm.id.focus();");
				out.print("window.self.close();");
				out.print("</script>");
			}
		}
	} catch (Exception e) {
		out.print(e.getMessage());
	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			out.print(e.getMessage());
		}
	}
%>