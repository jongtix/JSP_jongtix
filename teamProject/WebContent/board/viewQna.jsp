<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Q&A 보기</title>
</head>
<body>
	<div align="center">
		<h2>Q&A글 내용 보기</h2>
		<form action="">
			<table width="500" border="1" align="center">
				<tr>
					<th>글번호</th>
					<td>${board.num}</td>
					<th>조회수</th>
					<td>${board.readcount}</td>
				</tr>

				<tr>
					<th>작성자ID</th>
					<td>${board.writer}</td>
					<th>작성일</th>
					<td>${board.reg_date}</td>
				</tr>

				<tr>
					<th>글제목</th>
					<td colspan="3" class="left">${board.subject}</td>
				</tr>
				<tr>
					<th>글내용</th>
					<td colspan="3" class="left"><pre>
   ${board.content}
   </pre></td>
				</tr>
				<tr>
					<td align="center"><input type="button" value="글목록"
						onclick="location.href='listQna.do?pageNum=${pageNum}'"></td>
					<td colspan="3" align="center"><input type="button"
						value="글수정"
						onclick="location.href='updateQnaForm.do?num=${board.num}&pageNum=${pageNum}'">
						<input type="button" value="글삭제"
						onclick="location.href='deleteQnaForm.do?num=${board.num}&pageNum=${pageNum}'">
						<input type="button" value="답글쓰기"
						onclick="location.href='writeQnaForm.do?pageNum=${pageNum}&num=${board.num}&flag=${board.flag}&ref=${board.ref}&re_step=${board.re_step}&re_level=${board.re_level}'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>