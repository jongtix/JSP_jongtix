<%@page import="dao.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String password = request.getParameter("password");

	BoardDao dao = BoardDao.getInstance();
	int result = dao.useCheck(num, password); // 정상 1, 비정상 -1
	if (result == -1) {
		out.print("<script>alert('비밀번호를 확인해주세요.');history.back();</script>");
	} else if (result == 1) {
		/* 댓글의 존재 여부 확인 */
		boolean isTrue = false;
		isTrue = dao.isReply(num);
		if (!isTrue) { // 댓글이 없어서 삭제 가능
			result = dao.deleteBoard(num);
			if (result > 0) {
				out.print("<script>alert('삭제성공');location.href='list.jsp?pageNum=" + pageNum + "';</script>");
			} else {
				out.print("<script>alert('삭제실패');history.back();</script>");
			}
		} else { // 댓글이 있어서 삭제 불가능
			out.print("<script>alert('댓글이 존재합니다.');location.href='list.jsp?pageNum=" + pageNum + "';</script>");
		}
	}
%>