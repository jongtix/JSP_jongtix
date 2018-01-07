<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String[] Winners = new String[3];
	Winners[0] = request.getParameter("win1");
	Winners[1] = request.getParameter("win2");
	Winners[2] = request.getParameter("win3");

	request.setAttribute("winners", Winners);
	RequestDispatcher dis = request.getRequestDispatcher("WinnersView.jsp");
	dis.forward(request, response);
%>