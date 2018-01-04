<%@page import="model.Member"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	Connection conn = null;

	PreparedStatement pstmt = null;
	String sql1 = "insert into member2(id,password,name,birth) " + " values(?,?,?,?)";
	String sql2 = "insert into member2Info(id,address,tel,email) " + " values(?,?,?,?)";
	//파라미터 받기
	Member member = new Member();
	member.setId(request.getParameter("id"));
	member.setPassword(request.getParameter("password"));
	member.setName(request.getParameter("name"));
	member.setBirth(request.getParameter("birth"));
	member.setAddress(request.getParameter("address"));
	member.setEmail(request.getParameter("email"));
	member.setTel(request.getParameter("tel"));

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OraDB");
		conn = ds.getConnection();

		//3단계 - 1.쿼리 객체 설정
		pstmt = conn.prepareStatement(sql1);
		//AtuoCommit설정해제
		conn.setAutoCommit(false);//------

		pstmt.setString(1, member.getId());
		pstmt.setString(2, member.getPassword());
		pstmt.setString(3, member.getName());
		pstmt.setString(4, member.getBirth());//

		int result = pstmt.executeUpdate();
		if (result > 0) {
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getAddress());
			pstmt.setString(3, member.getTel());
			pstmt.setString(4, member.getEmail());

			if (pstmt.executeUpdate() > 0) {
				//member2테이블과  member2Info테이블 둘다 이상 없으면 commit;
				conn.commit();//----

				out.print("<script>");
				out.print("alert('회원가입을 축하드립니다.');");
				out.print("window.location.href='loginform.html';");
				out.print("</script>");
			}
		} else {//하나라도 작업이 이상이 있으면 rollback()처리
			conn.rollback();//----

			out.print("<script>");
			out.print("alert('입력실패!');");
			out.print("</script>");
		}
		//다시 자동커밋으로 설정
		conn.setAutoCommit(true);//----
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