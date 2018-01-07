<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- forward 사용 시 request 객체에 속성으로 값을 저장하여 이동
	 setAttribute(name, 값);
	 -> getAttribute(name);
-->
<%
	Calendar cal = Calendar.getInstance();
	request.setAttribute("time", cal);
%>
<jsp:forward page="/to/viewTime.jsp" />