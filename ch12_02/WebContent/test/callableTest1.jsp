<%@page import="java.sql.Types"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Connection conn = null;
	String sql = "{call plus(?, ?, ?)}";

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OraDB");
		conn = ds.getConnection();
		// 프로시져 호출
		CallableStatement cstmt = conn.prepareCall(sql);
		// binding변수 세팅
		cstmt.setInt(1, Integer.parseInt(request.getParameter("num1")));
		cstmt.setInt(2, Integer.parseInt(request.getParameter("num2")));
		// out.parameter 설정
		cstmt.registerOutParameter(3, Types.NUMERIC);
		// 실행
		cstmt.execute();
		// 실행 결과 받기
		int result = cstmt.getInt(3); // plus() 프로시져의 세 번째 파라미터 받기
		out.print("프로시져 실행 결과 : " + result);
	} catch (Exception e) {
		out.print(e.getMessage());
	}
%>