<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Book"%>
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

	String sql = "select * from book";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String chB = request.getParameter("chB");
	switch (chB) {
	case "title":
		sql += " where title like ?";
		break;
	case "writer":
		sql += " where writer like ?";
		break;
	default:
		sql += " where title like ? or writer like ?";
		break;
	}
	sql += " order by code";

	String searchVar = request.getParameter("searchVar");
	searchVar = "%" + searchVar + "%";
	List<Book> list = new ArrayList<>();
	try {
		pstmt = conn.prepareStatement(sql);
		if (chB.equals("total")) {
			pstmt.setString(1, searchVar);
			pstmt.setString(2, searchVar);
		} else {
			pstmt.setString(1, searchVar);
		}
		rs = pstmt.executeQuery();
		while (rs.next()) {
			Book book = new Book();
			book.setCode(rs.getInt(1));
			book.setTitle(rs.getString(2));
			book.setWriter(rs.getString(3));
			book.setPrice(rs.getInt(4));
			book.setRegDate(rs.getDate(5));
			list.add(book);
		}
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("BookInput.jsp");
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
		} catch (Exception e) {
			out.print(e.getMessage());
		}
	}
%>