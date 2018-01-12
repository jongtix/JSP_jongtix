<%@page import="dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	BookDao manager = BookDao.getInstance();
	int check = manager.managerCheck(id, password);
	if (check == 1) { // 정상 1, 비밀번호 오류 0, 아이디 오류 -1
		session.setAttribute("managerId", id);
		response.sendRedirect("../managerMain.jsp");
	} else if (check == 0) {
		out.print("<script>alert('비밀번호를 확인하세요.');history.back();</script>");
	} else {
		out.print("<script>alert('아이디를 확인하세요.');history.back();</script>");
	}
%>