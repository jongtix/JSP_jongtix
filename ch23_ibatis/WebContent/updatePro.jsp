<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="dto.Member" />
<jsp:setProperty property="*" name="member" />
<%
	MemberDao dao = MemberDao.getInstance();
	int result = dao.updateMember(member);
	if (result > 0) {
		out.print("<script>alert('수정 성공');location.href='list.jsp';</script>");
	} else {
		out.print("<script>alert('수정 실패');history.go(-1);</script>");
	}
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>