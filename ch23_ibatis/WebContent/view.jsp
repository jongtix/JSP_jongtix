<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = request.getParameter("id");
	MemberDao dao = MemberDao.getInstance();
	Member member = dao.getMemberInfo(id);
	request.setAttribute("member", member);
%>
<html>
<head>
<title>회원정보 조회</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>아이디</th>
			<td>${member.id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${member.name}</td>
		</tr>
		<tr>
			<th>등록일자</th>
			<td>${member.reg_date}</td>
		</tr>
		<tr>
			<td colspan=2><input type="button" value="리스트"
				onclick="location.href='list.jsp'"> <input type="button"
				value="수정" onclick="location.href='updateForm.jsp?id=${member.id}'">
				<input type="button" value="삭제"
				onclick="location.href='deleteForm.jsp?id=${member.id}'"></td>
		</tr>
	</table>
</body>
</html>