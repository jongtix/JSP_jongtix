<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="minfo" class="model.Member" scope="request" />
<jsp:setProperty property="name" name="minfo" param="name" />
<jsp:setProperty property="age" name="minfo" param="age" />
<%-- <jsp:setProperty property="*" name="minfo" /> --%>
<jsp:forward page="MemberInfoView.jsp" />