<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* 생성된 세션 정보 삭제 */
	session.invalidate();
	out.print("<script>alert('로그아웃 되었습니다.');location.href='../managerMain.jsp';</script>");
%>