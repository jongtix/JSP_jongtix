<%@page import="dao.LoginDao"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	LoginDao dao = LoginDao.getInstance();
	int result = dao.useCheck(id, password);
	if (result == 1) {
		out.print("<script>alert('로그인 성공.');location.href='list.jsp';</script>");
	} else {
		out.print("<script>alert('로그인 실패.');history.back();</script>");
	}
%>