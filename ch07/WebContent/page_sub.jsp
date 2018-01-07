<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- request는 페이지간 이동 객체, 이전 페이지에서 속성으로 name을 추가 -->
body_sub에서 name 파라미터 값 :
<%=request.getParameter("name")%>
<ul>
	<%
		String[] names = request.getParameterValues("name");
		for (String name : names) {
	%>
	<li><%=name%></li>
	<%
		}
	%>
</ul>