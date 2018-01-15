<%@page import="dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../managerSessionChk.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	if (request.getParameter("book_id") == null || request.getParameter("book_id").equals("")
			|| request.getParameter("book_kind") == null || request.getParameter("book_kind").equals("")) {
		out.print("<script>alert('북상품 아이디 또는 카테고리가 비어있습니다.');history.back();</script>");
	} else {
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		String book_kind = request.getParameter("book_kind");
		request.setAttribute("book_id", book_id);
		request.setAttribute("book_kind", book_kind);

		System.out.println(book_kind);
		BookDao dao = BookDao.getInstance();
		int result = dao.deleteBook(book_id);
		if (result > 0) {
			out.print(
					"<script>alert('삭제성공');location.href='bookList.jsp?book_kind=" + book_kind + "';</script>");
		} else {
			out.print("<script>alert('삭제실패');location.href='bookDeleteForm.jsp';</script>");
		}
	}
%>