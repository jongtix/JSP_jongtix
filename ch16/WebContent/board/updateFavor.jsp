<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDao dao = BoardDao.getInstance();
	int result = dao.updateFavor(num);
	if (result > 0) {
		out.print("<script>alert('좋아요');location.href='content.jsp?num=" + num + "&pageNum=" + pageNum
				+ "';</script>");
	} else {
		out.print("<script>alert('좋아요 실패');history.back();</script>");
	}
%>