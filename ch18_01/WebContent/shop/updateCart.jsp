<%@page import="dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int result = 0;
	int cart_id = Integer.parseInt(request.getParameter("cart_id"));
	int buy_count = Integer.parseInt(request.getParameter("buy_count"));
	String book_kind = request.getParameter("book_kind");
	CartDao dao = CartDao.getInstance();
	result = dao.updateCount(cart_id, buy_count);
	if (result > 0) {
		out.print("<script>alert('카트 수량 수정 완료');location.href='cartList.jsp?book_kind=" + book_kind
				+ "';</script>");
	} else if (result == -1) {
		out.print("<script>alert('재고가 부족합니다.');location.href='cartList.jsp?book_kind=" + book_kind
				+ "';</script>");
	} else {
		out.print("<script>alert('실패');history.back();</script>");
	}
%>