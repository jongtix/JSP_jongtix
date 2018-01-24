<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>리스트 페이지</title>
</head>
<body>
	<h2>게시판</h2>
	<table border="1">
		<caption>
			<h2>게시판</h2>
		</caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>email</th>
			<th>조회수</th>
			<th>IP</th>
			<th>작성일</th>
		</tr>
		<c:set var="rowNum" value="${pb.rowNum}" />
		<c:if test="${total == 0}">데이터가 없습니다.</c:if>
		<c:if test="${total > 0}">
			<c:forEach var="board" items="${list}">
				<c:if test="${board.del == 'Y'}">
					<tr>
						<td>${rowNum}</td>
						<td colspan="6"><b>삭제된 글입니다.</b></td>
					</tr>
				</c:if>
				<c:if test="${board.del != 'Y'}">
					<tr>
						<td>${rowNum}</td>
						<td><c:if test="${board.ref_level > 0}">
								<img alt="" src="images/level.gif"
									width="${board.ref_level * 10}" height="5">
								<img alt="" src="images/re.gif">
							</c:if><a href="view.do?num=${board.num}&pageNum=${pb.currentPage}">${board.subject}</a>
							<c:if test="${board.readcount > 20}">
								<img alt="" src="images/hot.gif">
							</c:if></td>
						<td><a href="mailto:${board.email}">${board.writer}</a></td>
						<td><a href="mailto:${board.email}">${board.email}</a></td>
						<td>${board.readcount}</td>
						<td>${board.ip}</td>
						<td><fmt:formatDate value="${board.reg_date}" type="date"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:if>
				<c:set var="rowNum" value="${rowNum - 1}" />
			</c:forEach>
		</c:if>
	</table>
	<p>
		<c:if test="${pb.startPage > pb.BLOCKSIZE}">
			<a href="list.do?pageNum=${pb.startPage - pb.BLOCKSIZE}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
			<a href="list.do?pageNum=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${pb.endPage < pb.pageCount}">
			<a href="list.do?pageNum=${pb.startPage + pb.BLOCKSIZE}">[다음]</a>
		</c:if>
		<a href="writeForm.do?pageNum=${pageNum}"><b>글쓰기</b></a><br>
</body>
</html>