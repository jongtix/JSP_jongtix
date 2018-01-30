<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	MemberDao dao = MemberDao.getInstance();
	int result = dao.useCheck(id, password);
	if (result == 1) {
		result = dao.deleteMember(id);
		if (result > 0) {
			out.print("<script>");
			out.print("alert('삭제 성공');");
			out.print("location.href='list.jsp'");
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("alert('삭제실패');");
			out.print("histoty.back();");
			out.print("</script>");
		}
	} else {
		out.print("<script>");
		out.print("alert('비밀번호가 틀립니다.');");
		out.print("history.back();");
		out.print("</script>");
	}
%>