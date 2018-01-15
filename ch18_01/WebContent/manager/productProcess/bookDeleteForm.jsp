<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../managerSessionChk.jsp"%>
<%
	if (request.getParameter("book_id") == null || request.getParameter("book_id").equals("")
			|| request.getParameter("book_kind") == null || request.getParameter("book_kind").equals("")) {
		out.print("<script>alert('북상품 아이디 또는 카테고리가 비어있습니다.');history.back();</script>");
	} else {
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		String book_kind = request.getParameter("book_kind");
		request.setAttribute("book_id", book_id);
		request.setAttribute("book_kind", book_kind);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../style.css" rel="stylesheet" type="text/css">
<title>도서 상품 삭제</title>
</head>
<body>
	<h2>도서 상품 삭제</h2>
	<a href="bookList.jsp?book_kind=${book_kind}">목록으로</a>
	<p>
		<input type="button" value="삭제"
			onclick="location.href='bookDeletePro.jsp?book_id=${book_id}&book_kind=${book_kind}';">
</body>
</html>