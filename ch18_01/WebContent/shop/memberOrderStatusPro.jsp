<%@page import="dao.BuyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int buy_id = Integer.parseInt(request.getParameter("buy_id"));
	String status = request.getParameter("sanction");
	BuyDao dao = BuyDao.getInstance();
	int result = dao.updateOrderStatus(buy_id, status);
	if (result > 0) {
		out.print("<script>alert('상태가 수정 되었습니다.');location.href='buyList.jsp';</script>");
	} else {
		out.print("<script>alert('상태 수정에 실패하였습니다.');history.back();</script>");
	}
%>