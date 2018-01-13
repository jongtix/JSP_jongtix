<%@page import="dao.MemberDao1"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
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
%>
<%
	/* 회원가입 처리 */
	MemberDao1 dao = new MemberDao1();
	int result = dao.insertMember(member);
	if (result > 0) {
		session.setAttribute("member", member);
		response.sendRedirect("sessionSubscribeResult.jsp");
	} else {
		out.print("<script>");
		out.print("alert('입력실패!');");
		out.print("history.back();");
		out.print("</script>");
	}
%>