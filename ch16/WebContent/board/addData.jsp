<%@page import="model.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		BoardDao dao = BoardDao.getInstance();
		Board board = new Board();
		for (int i = 0; i < 1; i++) {
			board.setWriter("홍길동" + i);
			board.setSubject("제목 : " + i);
			board.setContent("내용 : " + i);
			board.setEmail("이메일 : " + i + "@naver.com");
			board.setPassword("1111");
			board.setNumber(0);
			board.setIp("127.0.0.1");
			dao.insert(board);
		}
	%>
</body>
</html>