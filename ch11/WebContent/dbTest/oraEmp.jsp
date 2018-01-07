<%@page import="model.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 사원번호, 사원명, 입사일자, 부서코드 -->
<%
	String driver = application.getInitParameter("driver");
	String url = application.getInitParameter("url");
	String user = application.getInitParameter("user");
	String password = application.getInitParameter("password");
	int deptno = Integer.parseInt(request.getParameter("deptno"));

	String sql = "select empno, ename, hiredate, deptno from emp where deptno = ?";

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, password);
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<Emp> list = new ArrayList<>();

	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, deptno);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			// Bean 객체 생성
			Emp emp = new Emp();

			// 속성 저장
			emp.setEmpno(rs.getInt(1));
			emp.setEname(rs.getString(2));
			emp.setHiredate(rs.getDate(3));
			emp.setDeptno(rs.getInt(4));

			// list에 Bean객체 저장
			list.add(emp);
		}
		rs.close();
		pstmt.close();
		conn.close();
		request.setAttribute("empList", list);
		RequestDispatcher dis = request.getRequestDispatcher("oraEmpView.jsp");
		dis.forward(request, response);
	} catch (Exception e) {

	}
%>