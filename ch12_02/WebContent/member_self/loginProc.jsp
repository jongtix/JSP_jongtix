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

	String sql = "select password from member2 where id = ?";
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String id = request.getParameter("id");
	String pwd = request.getParameter("password");

	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (rs.getString(1).equals(pwd)) {
				out.print("<script>alert('로그인 성공');</script>");
			} else {
				out.print("<script>alert('비밀번호가 다릅니다.');history.back();</script>");
			}
		} else { /* id로 조회 결과가 없으면 실행 */
			out.print("<script>alert('없는 아이디입니다.');history.back();</script>");
		}
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
		} catch (Exception e) {
			out.print(e.getMessage());
		}
	}
%>