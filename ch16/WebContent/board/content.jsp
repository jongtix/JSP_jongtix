<%@page import="model.FavorBean"%>
<%@page import="model.Board"%>
<%@page import="dao.BoardDao"%><%@ page language="java"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="color.jsp"%>
<html>
<head>
<title>내용 보기</title>
<link href="/ch16/css/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
body, td {
	text-align: center;
}

td {
	background-color: "<%=value_c%>";
}

.left {
	text-align: left;
}
</style>
</head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDao dao = BoardDao.getInstance();
	Board board = dao.getBoard(num);/* 파라미터로 받은 글번호로 글내용을 가져옴 */

	int ref = board.getRef();
	int re_step = board.getRe_step();
	int re_level = board.getRe_level();

	FavorBean favor = dao.getFavor(num);
%>
<body bgcolor="<%=bodyback_c%>">
	<h2>글 내용 보기</h2>
	<form action="">
		<table width="500" border="1" bgcolor="<%=bodyback_c%>" align="center">
			<tr height="30">
				<th>글번호</th>
				<td><%=board.getNumber()%></td>
				<th>조회수</th>
				<td><%=board.getReadcount()%></td>
			</tr>
			<tr height="30">
				<th>작성자</th>
				<td><%=board.getWriter()%></td>
				<th>작성일</th>
				<td><%=board.getReg_date()%></td>
			</tr>

			<tr height="30">
				<th>글제목</th>
				<td colspan="3" class="left"><%=board.getSubject()%></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td colspan="3" class="left"><pre>
   <%=board.getContent()%>
   </pre></td>
			</tr>
			<tr height="30">
				<td colspan="3"><input type="button" value="글수정"
					onclick="location.href='updateForm.jsp?num=<%=board.getNumber()%>&pageNum=<%=pageNum%>'">

					<input type="button" value="글삭제"
					onclick="location.href='deleteForm.jsp?num=<%=board.getNumber()%>&pageNum=<%=pageNum%>'">

					<input type="button" value="답글쓰기"
					onclick="location.href='writerForm.jsp?num=<%=board.getNumber()%>&pageNum=<%=pageNum%>&ref=<%=board.getRef()%>&re_step=<%=board.getRe_step()%>&re_level=<%=board.getRe_level()%>'">

					<input type="button" value="글목록"
					onclick="location.href='list.jsp?pageNum=<%=pageNum%>'"></td>
				<td>
					<table border="1">
						<tr>
							<td><a
								href="updateFavor.jsp?num=<%=num%>&pageNum=<%=pageNum%>">좋아요</a></td>
							<td><a
								href="updateHate.jsp?num=<%=num%>&pageNum=<%=pageNum%>">싫어요</a></td>
						</tr>
						<tr>
							<td><%=favor.getFavorcnt()%></td>
							<td><%=favor.getHatecnt()%></td>
						</tr>
					</table>
			</td>
			</tr>
		</table>
	</form>
</body>
</html>