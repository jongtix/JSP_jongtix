<%@page import="dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String book_kind = request.getParameter("book_kind");
	String buyer = (String) session.getAttribute("id");
%>
<jsp:useBean id="cart" class="model.Cart" />
<jsp:setProperty property="*" name="cart" />
<%
	cart.setBuyer(buyer);
	CartDao dao = CartDao.getInstance();
	int result = dao.insertCart(cart, buyer);
	if (result > 0) {
		out.print(
				"<script>alert('카트 저장 성공');location.href='cartList.jsp?book_kind=" + book_kind + "'</script>");
		response.sendRedirect("cartList.jsp?book_kind=" + book_kind);
	} else {
		out.print("<script>alert('에러가 발생하였습니다.');history.back();</script>");
	}
%>