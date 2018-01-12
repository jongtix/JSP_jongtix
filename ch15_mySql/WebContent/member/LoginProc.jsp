<%@page import="dao.MemberDao1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 처리</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		MemberDao1 dao = new MemberDao1();
		int result = dao.userCheck(id, password);
		if (result == 1) {
			session.setAttribute("id", id);
			session.setAttribute("password", password);
			response.sendRedirect("loginResult.jsp");
			out.print("<script>alert('환영합니다.');</script>");
		} else if (result == 0) {
			out.print("<script>alert('비밀번호를 확인하세요.');history.back();</script>");
		} else if (result == 2) {
			out.print("<script>alert('없는 아이디입니다.');history.back();</script>");
		}
	%>
</body>
</html>