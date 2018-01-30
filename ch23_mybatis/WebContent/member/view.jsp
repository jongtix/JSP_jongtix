<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="dto.Member"%><%@page import="dao.MemberDao"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회원정보 조회</title>
</head>
<body>
<table border=1 >
<tr><th>아이디</th><td>${member.id}</td>
</tr>
<tr>
  <th>이름</th><td>${member.name}</td>
</tr>
<tr>
<th>등록일자</th><td>${member.reg_date}</td>
</tr>
<tr>
<td colspan=2>
<input type="button" value="리스트" onclick="location.href='list.do'">
<input type="button" value="수정" onclick="location.href='updateForm.do?id=${member.id}'">
<input type="button" value="삭제" onclick="location.href='deleteForm.do?id=${member.id}'">
</td>
</tr>
</table>
</body>
</html>