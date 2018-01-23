<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>게시글 쓰기</title>
</head>
<body>
	<form action="writePro.do" method="post">
		<input type="hidden" name="num" value="${board.num}"> <input
			type="hidden" name="ref" value="${board.ref}"> <input
			type="hidden" name="ref_level" value="${board.ref_level}"> <input
			type="hidden" name="re_step" value="${board.re_step}"> <input
			type="hidden" name="pageNum" value="${pageNum}">
		<table>
			<caption>
				<b>게시판</b>
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
				<th>작성자</th>
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
				<td colspan="2"><input type="submit" value="확인"> <input
					type="reset" value="다시쓰기"></td>
			</tr>
		</table>
	</form>
</body>
</html>