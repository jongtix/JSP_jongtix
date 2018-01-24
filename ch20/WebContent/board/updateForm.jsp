<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>게시글 조회 폼</title>
<script type="text/javascript" src="/ch20/js/script.js"></script>
</head>
<body>
	<h2>글 수정</h2>
	<form action="updatePro.do" method="post" name="writeForm"
		onsubmit="return writeSave()">
		<!-- 화면에 보이지 않는 데이타를 넘기기 위한 요소 hidden 속성 처리  -->
		<input type="hidden" name="num" value="${num}"> <input
			type="hidden" name="pageNum" value="${pageNum}">

		<table width="400" border="1">
			<tr>
				<th>이름</th>
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
				<td colspan="2"><c:if test="${error != null}">${error}<br>
					</c:if><input type="submit" value="글 수정"> <input type="reset"
					value="다시작성"> <input type="button" value="목록보기"
					onclick="location.href='list.do?pageNum=${pageNum}'"></td>
			</tr>
		</table>
	</form>

</body>
</html>