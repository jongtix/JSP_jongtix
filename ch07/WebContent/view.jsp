<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* navi부분에서 이동 처리 */
	String code = request.getParameter("code");
	String viewPageURI = "/viewModule/";

	viewPageURI += code.toLowerCase() + ".jsp";

	/* if ("A".equals(code)) {
		viewPageURI = "/viewModule/a.jsp";
	} else if ("B".equals(code)) {
		viewPageURI = "/viewModule/b.jsp";
	} else if ("C".equals(code)) {
		viewPageURI = "viewModule/c.jsp";
	} */
%>
<jsp:forward page="<%=viewPageURI%>" />