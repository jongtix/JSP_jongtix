<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="board" class="model.Board" />
<jsp:setProperty property="*" name="board" />
<%
	BoardDao dao = BoardDao.getInstance();
	int result = dao.useCheck(board.getNumber(), board.getPassword());//리턴값이 1이면 비번이 맞고, -1이면 비번이 틀림
	if (result == 1) {//패스워드가 맞으면 수정 처리
		result = dao.updateBoard(board);
		if (result > 0) {
			out.print("<script>");
			out.print("alert('수정완료');");
			out.print("window.location.href='list.jsp?pageNum=" + pageNum + "';");
			out.print("</script>");
			// response.sendRedirect("list.jsp?pageNum="+pageNum);
		} else {
			out.print("<script>");
			out.print("alert('수정실패');");
			out.print("history.back();");
			out.print("</script>");
		} //update 처리 
	} else if (result == -1) {//패스워드가 다르면 되돌림.
		out.print("<script>");
		out.print("alert('패스워드가 다릅니다.');");
		out.print("history.back();");
		out.print("</script>");
	} //패스워드 조회 처리
%>