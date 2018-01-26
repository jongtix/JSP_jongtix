<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="dto.Member" />
<jsp:setProperty property="*" name="member" />
<%
	MemberDao dao = MemberDao.getInstance();
	int result = dao.insertMember(member);
	if (result > 0) {
		out.print("<script>alert('저장 성공');location.href='list.jsp';</script>");
	} else {
		out.print("<script>alert('저장 실패');history.back();</script>");
	}
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>