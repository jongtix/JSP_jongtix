<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	ArrayList<String> items = new ArrayList<>();
	items.add(request.getParameter("win1"));
	items.add(request.getParameter("win2"));
	items.add(request.getParameter("win3"));

	request.setAttribute("fruits", items);
	RequestDispatcher dis = request.getRequestDispatcher("FruitsView.jsp");
	dis.forward(request, response);
%>