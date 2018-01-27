<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Q&A 게시글 조회 폼</title>
<script type="text/javascript" src="/teamProject/js/script.js"></script>
</head>
<body>
	<div align="center">
		<h2>Q&A 글 수정</h2>
		<form action="updateQnaPro.do" method="post" name="writeForm"
			onsubmit="return writeSave()">
			<input type="hidden" name="num" value="${num}"> <input
				type="hidden" name="pageNum" value="${pageNum}">

			<table width="400" border="1">
				<tr>
					<th>작성자ID</th>
					<td class="left"><input type="text" size="10" maxlength="10"
						name="writer" value="${board.writer}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" size="40" maxlength="50" name="subject"
						value="${board.subject}"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" size=40 " maxlength="30" name="email"
						value="${board.email}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="30" name="content">
					${board.content}</textarea></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td class="left"><input type="password" size="10"
						maxlength="10" name="password"></td>
				</tr>
				<tr>
					<td><input type="button" value="목록보기"
						onclick="location.href='listQna.do?pageNum=${pageNum}'"></td>
					<td align="center"><c:if test="${error != null}">${error}<br>
						</c:if><input type="submit" value="글 수정"> <input type="button"
						value="취소"
						onclick="location.href='viewQna.do?num=${num}&pageNum=${pageNum}'">
						<input type="reset" value="다시작성"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>