<%@ page contentType = "text/html; charset=utf-8" %>
<%
	String path = application.getContextPath();
%>
<p>책분류</p>

<a href="<%=path %>/shop/list.jsp?book_kind=all">전체목록보기</a><br>
<a href="<%=path %>/shop/list.jsp?book_kind=100">문학</a><br>
<a href="<%=path %>/shop/list.jsp?book_kind=200">외국어</a><br>
<a href="<%=path %>/shop/list.jsp?book_kind=300">컴퓨터</a><br>