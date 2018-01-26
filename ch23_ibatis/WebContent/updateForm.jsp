<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
	MemberDao dao = MemberDao.getInstance();
	Member member = dao.getMemberInfo(id);

	request.setAttribute("member", member);
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="updatePro.jsp">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" value="${member.id}" name="id" disabled></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" value="${member.name}" name="name"></td>
			</tr>
			<tr>
				<th>등록일자</th>
				<td><input type="date" value="${member.reg_date}"
					name="reg_date"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>
</body>
</html>