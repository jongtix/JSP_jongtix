<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Connection conn = null;
	String sql1 = "insert into student(num, name) values(12, '홍길동')";
	String sql2 = "select * from student where num = 12";

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OraDB");
		conn = ds.getConnection();
		conn.setAutoCommit(false); // 자동 커밋 설정 해제
		PreparedStatement pstmt = conn.prepareStatement(sql1, ResultSet.TYPE_SCROLL_SENSITIVE,
				ResultSet.CONCUR_UPDATABLE);
		pstmt.executeUpdate();
		pstmt.close();
		pstmt = conn.prepareStatement(sql2);
		ResultSet rs = pstmt.executeQuery();
		if (!rs.next()) {
			// 입력 처리한 결과가 없으면 rollback
			conn.rollback();
			out.print("<h3>데이터 삽입에 문제가 발생하였습니다.</h3>");
		} else {
			// 입력 처리한 결과가 있으면 commit
			conn.commit();
			out.print("<h3>데이터 삽입이 완료되었습니다.</h3>");
		}
		pstmt.close();
		conn.setAutoCommit(true);
		conn.close();
	} catch (Exception e) {
		out.print(e.getMessage());
	}
%>