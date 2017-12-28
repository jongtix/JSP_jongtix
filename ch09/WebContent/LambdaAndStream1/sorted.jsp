<%@page import="model.Member"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 정렬</title>
</head>
<body>
	<%
		List<Member> memberList = Arrays.asList(new Member("홍길동", 20), new Member("이순신", 54), new Member("유관순", 19),
				new Member("왕건", 42));
		request.setAttribute("members", memberList);
	%>
	${sortedMem = members.stream().sorted((m1, m2) -> m1.age.compareTo(m2.age)).toList();''}
	${sortedMem.stream().map(m->m.name).toList()}
	${sortedMem.stream().map(m->m.age).toList()}
	<!-- stream() 내부 반복자, iterator 외부 반복자 -->
	<!-- 람다식 -->
</body>
</html>