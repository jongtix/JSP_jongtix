<%@page import="util.CookieBox"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	MemberDao dao = new MemberDao();
	int chk = dao.userCheck(id, password);
	if (chk == 1) { /* 아이디와 패스워드가 모두 정상 */
		Cookie cookie = CookieBox.createCookie("id", id, 60 * 20);
		response.addCookie(cookie);
		response.sendRedirect("cookieMain.jsp");
	} else if (chk == 0) { /* 아이디는 맞지만 패스워드가 틀린 경우 */
		out.print("<script>alert('패스워드가 맞지 않습니다.');history.back();</script>");
	} else { /* 아이디가 없는 경우 */
		out.print("<script>alert('아이디가 맞지 않습니다.');history.go(-1);</script>");
	}
%>