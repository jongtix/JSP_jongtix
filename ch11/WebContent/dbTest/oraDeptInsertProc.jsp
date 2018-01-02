<%@page import="model.Dept"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String driver = application.getInitParameter("driver");
	String url = application.getInitParameter("url");
	String user = application.getInitParameter("user");
	String password = application.getInitParameter("password");

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, password);

	// 수정 작업 변수
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "insert into dept values(?, ?, ?)";
	String sql2 = "select count(*) from dept where deptno = ?";
	String sql3 = "select * from dept order by deptno";

	int deptno = Integer.parseInt(request.getParameter("deptno"));

	// Bean 객체들을 저장할 List생성
	List<Dept> list = new ArrayList<>();

	try {
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1, deptno);
		rs = pstmt.executeQuery();

		// 부서코드가 존재하면 다시 뒤로 back;
		if (rs.next()) {
			if (rs.getInt(1) > 0) {
				out.print("<script>");
				out.print("alert('존재하는 부서코드입니다.');");
				out.print("history.back();"); /* BOM(Browser Object Method) */
				out.print("</script>");
			}
		}
		// 부서코드가 존재하지 않으면 insert작업 실행
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, deptno);
		pstmt.setString(2, request.getParameter("dname"));
		pstmt.setString(3, request.getParameter("location"));

		int result = pstmt.executeUpdate();
		if (result > 0) {
			pstmt = conn.prepareStatement(sql3);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Dept dept = new Dept();
				int dno = rs.getInt(1);
				String dname = rs.getString(2);
				String loc = rs.getString(3);
				dept.setDeptno(dno);
				dept.setDname(dname);
				dept.setLoc(loc);
				list.add(dept);
			}
			request.setAttribute("list", list);
		}

		RequestDispatcher dis = request.getRequestDispatcher("oraDeptInsertResult.jsp");
		dis.forward(request, response);
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
		} catch (Exception ex) {
			out.print(ex.getMessage());
		}
	}
%>