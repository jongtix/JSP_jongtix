<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="model.Board" />
<jsp:setProperty property="*" name="board" />
<%
	String pageNum = request.getParameter("pageNum");
	board.setIp(request.getRemoteAddr());
	BoardDao dao = BoardDao.getInstance();
	int result = dao.insert(board);
	if (result > 0) {
		response.sendRedirect("list.jsp?pageNum=" + pageNum);
	} else {
		out.print("<script>alert('입력 실패');history.back();</script>");
	}
%>