<%@page import="dao.LoginDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	LoginDao dao = LoginDao.getInstance();
	int result = dao.userCheck(id, password);

	if (result == 1) {
		session.setAttribute("id", id);
		out.print("<script>");
		out.print("alert('로그인 되었습니다.');");
		out.print("location.href='calendarInit.jsp';");
		out.print("</script>");
	} else {
		out.print("<script>");
		out.print("alert('로그인 실패');");
		out.print("history.back();");
		out.print("</script>");
	}
%>
