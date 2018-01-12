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
<title>회원 정보 수정</title>
</head>
<body>
	<jsp:useBean id="member" class="model.Member" />
	<jsp:setProperty property="*" name="member" />
	<%
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String tel = tel1 + " - " + tel2 + " - " + tel3;
		String emailId = request.getParameter("emailId");
		String emailDomain = request.getParameter("email2");
		String email = emailId + "@" + emailDomain;

		member.setTel(tel);
		member.setEmail(email);

		MemberDao1 dao = new MemberDao1();
		int result = dao.updateMember(member);
		if (result > 0) {
			out.print("<script>alert('수정완료');window.location.href='memberList.jsp';</script>");
		} else {
			out.print("<script>alert('수정실패');history.back();</script>");
		}
	%>
</body>
</html>