<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Connection conn = null;
	String sql = "insert into testblob(id, pwd, name, photo) values(?, ?, ?, ?)";

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OraDB");
		conn = ds.getConnection();
		conn.setAutoCommit(false); // 자동 커밋 설정 해제
		File file = new File("C:\\images\\Desert.jpg");
		InputStream is = new FileInputStream(file);
		int fileSize = (int) file.length();

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "aa");
		pstmt.setString(2, "1234");
		pstmt.setString(3, "사막");
		pstmt.setBinaryStream(4, is, fileSize); // 이미지 파일 세팅

		int result = pstmt.executeUpdate();
		if (result > 0) {
			conn.commit();
		} else {
			conn.rollback();
		}
		is.close();
		pstmt.close();
		conn.setAutoCommit(true);
		conn.close();
		out.print("입력 처리 완료");
	} catch (Exception e) {
		out.print(e.getMessage());
	}
%>