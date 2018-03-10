<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String id = (String) session.getAttribute("id");
	request.setAttribute("id", id);
%>
<!doctype html>
<html lang="ko">
<head>
<meta name="viewprot" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<meta charset="utf-8">
<title>Q&A</title>
</head>
<body>
	<jsp:include page="/module/top.jsp" />
	<div class="container">
		<div align="center">
			<div align="right">
				<a href="listFaq.do">FAQ 게시판 바로가기</a>
			</div>
			<p>
			<table border="1">
				<caption>
					<h2>Q&A 게시판</h2>
				</caption>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자ID</th>
					<th>email</th>
					<th>조회수</th>
					<th>IP</th>
					<th>작성일</th>
					<th>관리자 메뉴</th>
				</tr>
				<c:set var="rowNum" value="${pb.rowNum}" />
				<c:if test="${total == 0}">
					<tr>
						<td colspan="8" align="center">데이터가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${total > 0}">
					<c:forEach var="board" items="${list}">
						<%-- <c:if test="${board.del == 'Y'}">
						<tr>
							<td>${rowNum}</td>
							<td colspan="7"><b>삭제된 글입니다.</b></td>
						</tr>
					</c:if> --%>
						<c:if test="${board.del != 'Y'}">
							<tr>
								<td>${rowNum}</td>
								<td><c:if test="${board.re_level > 0}">
										<img alt="" src="images/level.gif"
											width="${board.re_level * 10}" height="5">
										<img alt="" src="images/re.gif">
									</c:if><a href="viewQna.do?num=${board.num}&pageNum=${pb.currentPage}">${board.subject}</a>
									<c:if test="${board.readcount > 20}">
										<img alt="" src="images/hot.gif">
									</c:if></td>
								<td><a href="mailto:${board.email}">${board.writer}</a></td>
								<td><a href="mailto:${board.email}">${board.email}</a></td>
								<td>${board.readcount}</td>
								<td>${board.ip}</td>
								<td><fmt:formatDate value="${board.reg_date}" type="date"
										pattern="yyyy-MM-dd" /></td>
								<td><a
									href="moveFaqForm.do?num=${board.num}&pageNum=${pb.currentPage}">FAQ로
										옮기기</a></td>
							</tr>
						</c:if>
						<c:set var="rowNum" value="${rowNum - 1}" />
					</c:forEach>
				</c:if>
			</table>
			<form action="search.do" method="post">
				<select id="searchCondition" name="searchCondition">
					<option value="all"
						<c:if test="${searchCondition == 'all'}">selected="selected"</c:if>>전체</option>
					<option value="title"
						<c:if test="${searchCondition == 'title'}">selected="selected"</c:if>>제목</option>
					<option value="content"
						<c:if test="${searchCondition == 'content'}">selected="selected"</c:if>>내용</option>
					<option value="writer"
						<c:if test="${searchCondition == 'writer'}">selected="selected"</c:if>>작성자</option>
				</select> <input type="text" id="searchKeyword" name="searchKeyword"
					<c:if test="${searchKeyword != null}">value='${searchKeyword}'</c:if>>
				<input type="submit" value="검색">
			</form>
			<p>

				<c:if test="${pb.startPage > pb.BLOCKSIZE}">
					<a href="listQna.do?pageNum=${pb.startPage - pb.BLOCKSIZE}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
					<a href="listQna.do?pageNum=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${pb.endPage < pb.pageCount}">
					<a href="listQna.do?pageNum=${pb.startPage + pb.BLOCKSIZE}">[다음]</a>
				</c:if>
				<a href="writeQnaForm.do?pageNum=${pb.currentPage}"><b>글쓰기</b></a> <br>
		</div>
	</div>
	<jsp:include page="/module/bottom.jsp" />
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>