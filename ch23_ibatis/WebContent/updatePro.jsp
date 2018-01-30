<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String reg_date = request.getParameter("reg_date");
	Member member = new Member();
	member.setId(id);
	member.setName(name);

	/* <input type="date">값 -> Member의 java.sql.Date로 변환하기 */
	SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
	java.sql.Date dt = new java.sql.Date(sm.parse(reg_date).getTime());
	member.setReg_date(dt);
%>
<%-- <jsp:useBean id="member" class="dto.Member"/>
<jsp:setProperty property="*" name="member"/>  --%>
<%
	MemberDao dao = MemberDao.getInstance();
	int result = dao.updateMember(member);
	if (result > 0) {
		out.print("<script>");
		out.print("alert('수정성공!');");
		out.print("location.href='list.jsp'");
		out.print("</script>");
	} else {
		out.print("<script>");
		out.print("alert('수정실패');");
		out.print("history.go(-1);");
		out.print("</script>");
	}
%>
