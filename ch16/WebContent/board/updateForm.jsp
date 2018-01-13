<%@page import="dao.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="color.jsp"%>
<html>
<head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	Board board = new Board();
	BoardDao dao = BoardDao.getInstance();
	board = dao.getBoard(num);
%>
<title>게시글 조회 폼</title>
<link href="/ch16/css/style.css" type="text/css" rel="stylesheet">
<style type="text/css">
body, td {
	text-align: center;
}

td {
	background-color: "<%=value_c%>";
}
</style>
<script type="text/javascript" src="/ch16/js/script.js"></script>
</head>

<body bgcolor="<%=bodyback_c%>">
	<h2>글 수정</h2>
	<form action="updateProc.jsp" method="post" name="writeForm"
		onsubmit="return writeSave()">
		<!-- 화면에 보이지 않는 데이타를 넘기기 위한 요소 hidden 속성 처리  -->
		<input type="hidden" name="number" value=<%=num%>> <input
			type="hidden" name="pageNum" value=<%=pageNum%>>
		<table width="400" border="1" bgcolor="<%=bodyback_c%>">
			<tr>
				<th>이름</th>
				<td class="left"><input type="text" size="10" maxlength="10"
					name="writer" value="<%=board.getWriter()%>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" size="40" maxlength="50" name="subject"
					value="<%=board.getSubject()%>"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" size=40 " maxlength="30" name="email"
					value="<%=board.getEmail()%>"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="30" name="content"><%=board.getContent()%></textarea></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td class="left"><input type="password" size="10"
					maxlength="10" name="password"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="글 수정"> <input
					type="reset" value="다시작성"> <input type="button"
					value="목록보기"
					onclick="location.href='list.jsp?pageNum=<%=pageNum%>'"></td>
			</tr>
		</table>
	</form>

</body>
</html>