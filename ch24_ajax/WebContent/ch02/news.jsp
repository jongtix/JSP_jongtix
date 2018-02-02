<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String[] news = { "겨울", "눈", "평창", "올림픽", "동계 올림픽" };
	for (int i = 0; i < news.length; i++) {
		out.print("<b>" + news[i] + "</b><br>");
	}
%>