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

	member.setTel1(tel1);
	member.setTel2(tel2);
	member.setTel3(tel3);
	member.setEmail(email);
%>
<%
	/* 회원가입 처리 */
	MemberDao1 dao = MemberDao1.getInstance();
	int result = dao.insertMember(member);
	System.out.println("result = " + result);
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