<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="dto.Member" />
<jsp:setProperty property="*" name="member" />
<%
	MemberDao dao = MemberDao.getInstance();
	int result = dao.insertMember(member);
	if (result > 0) {
		out.print("<script>");
		out.print("alert('회원가입성공!');");
		out.print("location.href='list.jsp';");
		out.print("</script>");
	} else {
		out.print("<script>");
		out.print("alert('회원가입실패!');");
		out.print("history.go(-1);");
		out.print("</script>");
	}
%>
