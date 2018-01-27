<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Q&A 글쓰기</title>
</head>
<body>
	<div align="center">
		<form action="writeQnaPro.do" method="post">
			<input type="hidden" name="num" value="${board.num}"> <input
				type="hidden" name="flag" value="${board.flag}"> <input
				type="hidden" name="ref" value="${board.ref}"> <input
				type="hidden" name="re_level" value="${board.re_level}"> <input
				type="hidden" name="re_step" value="${board.re_step}"> <input
				type="hidden" name="pageNum" value="${pageNum}">
			<table border="1">
				<caption>
					<b>Q&A 게시판</b>
				</caption>
				<tr>
					<th>제목</th>
					<td><c:if test="${board.num == 0}">
							<input type="text" name="subject" required>
						</c:if> <c:if test="${board.num != 0}">
							<input type="text" name="subject" required value="[답변]">
						</c:if></td>
				</tr>
				<tr>
					<th>작성자ID</th>
					<td><input type="text" name="writer" required></td>
				</tr>
				<tr>
					<th>email</th>
					<td><input type="text" name="email" required></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="password" required></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="password2" required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="5" cols="30" name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="확인">
						<c:if test="${board.num != 0}">
							<input type="button" value="취소"
								onclick="location.href='viewQna.do?num=${board.num}&pageNum=${pageNum}'">
						</c:if> <c:if test="${board.num == 0}">
							<input type="button" value="취소"
								onclick="location.href='listQna.do?pageNum=${pageNum}'">
						</c:if></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>