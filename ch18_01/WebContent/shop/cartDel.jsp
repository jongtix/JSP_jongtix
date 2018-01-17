<%@page import="dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int result = 0;
	String list = request.getParameter("list");
	String buyer = (String) session.getAttribute("id");
	String book_kind = request.getParameter("book_kind");
	CartDao dao = CartDao.getInstance();
	if (list.equals("all")) {
		result = dao.deleteAll(buyer);
	} else {
		result = dao.deleteCart(Integer.parseInt(list));
	}

	if (result > 0) {
		out.print("<script>alert('카트를 비웠습니다.');location.href='cartList.jsp?book_kind=" + book_kind + "';</script>");
	} else {
		out.print("<script>alert('실패');history.back();</script>");
	}
%>