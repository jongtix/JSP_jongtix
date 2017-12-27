<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int sum = 0;
	for (int i = 0; i <= 100; i++) {
		sum += i;
	}
	request.setAttribute("result", sum);
	RequestDispatcher dis = request.getRequestDispatcher("HundredResult2.jsp");
	dis.forward(request, response);
%>