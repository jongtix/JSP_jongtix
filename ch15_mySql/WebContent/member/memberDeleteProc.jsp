<%@page import="dao.MemberDao1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberDao1 dao = new MemberDao1();
		int result = dao.userCheck(id, password);
		if (result == 0) {
			out.print("<script>alert('패스워드를 확인해주세요.');history.back();</script>");
		} else if (result == 1) {
			result = dao.deleteMember(id);
			if (result > 0) {
				out.print("<script>alert('삭제완료');window.location.href='loginform.html';</script>");
			} else {
				out.print("<script>alert('삭제실패');history.back();</script>");
			}
		}
	%>
</body>
</html>