<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String[] arr = { "불고기", "오므라이스", "콩국수" };
	request.setAttribute("menu", arr);
%>
<jsp:forward page="LunchView.jsp" />