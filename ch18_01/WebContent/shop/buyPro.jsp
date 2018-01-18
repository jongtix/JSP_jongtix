<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String account = request.getParameter("account");
	String deliveryName = request.getParameter("deliveryname");
	String deliveryTel = request.getParameter("deliverytel1") + " - " + request.getParameter("deliverytel2")
			+ " - " + request.getParameter("deliverytel3");
	String deliveryAddress = request.getParameter("zipno") + " : " + request.getParameter("deliveryaddress1")
			+ " : " + request.getParameter("deliveryaddress2");
	String buyer = (String) session.getAttribute("id");

	CartDao dao = CartDao.getInstance();
	ArrayList<Cart> list = dao.getCartList(buyer);

	BuyDao bDao = BuyDao.getInstance();
	Buy buy = new Buy();
	buy.setBuyer(buyer);
	buy.setAccount(account);
	buy.setDeliveryname(deliveryName);
	buy.setDeliverytel(deliveryTel);
	buy.setDeliveryaddress(deliveryAddress);
	int result = bDao.insertBuy(list, buy);
	if (result > 0) {
		out.print("<script>alert('구매 처리 완료!');location.href='buyList.jsp';</script>");
	} else {
		out.print("<script>alert('구매 처리 실패!');history.back();</script>");
	}
%>