<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.MemberDao1"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");

	String id = request.getParameter("id");
	String password = "";

	MemberDao1 dao = MemberDao1.getInstance();
	if (id == null && name != null && birth != null) {
		id = dao.searchMember(name, birth);
		if (id != null && !id.equals("")) {
			out.print("<script>var id = '" + id + "';var name = '" + name
					+ "';alert(name + '님의 아이디는 ' + id + '입니다.');location.href='../shop/shopMain.jsp';</script>");
		} else {
			out.print("<script>alert('아이디가 존재하지 않습니다.');history.back();</script>");
		}
	} else if (id != null && name != null && birth != null) {
		password = dao.searchMember(name, birth, id);
		if (password != null && !password.equals("")) {
			out.print("<script>var password = '" + password + "';var name = '" + name
					+ "';alert(name + '님의 비밀번호는 ' + password + '입니다.');location.href='../shop/shopMain.jsp';</script>");
		} else {
			out.print("<script>alert('아이디가 존재하지 않습니다.');history.back();</script>");
		}
	}
%>