<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.sun.jmx.snmp.Enumerated"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>요청 파라미터 출력</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<b>request.getParameter()메소드 사용</b>
	<br> name 파라미터 =
	<%=request.getParameter("name")%><br> address 파라미터 =
	<%=request.getParameter("address")%>
	<p></p>
	<b>request.getParameterValues()메소드 사용</b>
	<br>
	<%
		String[] values = request.getParameterValues("pet");
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
	%>
	<%=values[i]%>
	<%
			}
		}
	%>
	<p></p>
	<b>request.getParameterNames()메소드 사용</b>
	<br>
	<%
		Enumeration parameterEnum = request.getParameterNames();
		while (parameterEnum.hasMoreElements()) {
			String name = (String) parameterEnum.nextElement();
	%>
	<%=name%>
	<%
		}
	%>
	<p></p>
	<b>request.getParameterMap()메소드 사용</b>
	<br>
	<%
		Map parameterMap = request.getParameterMap();
		String[] nameParams = (String[]) parameterMap.get("name");
		if (nameParams != null) {
	%>
	name =
	<%=nameParams[0]%>
	<%
		}
	%>
</body>
</html>