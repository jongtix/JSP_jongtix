<%@page import="dao.BookDao"%>
<%@page import="model.Book"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../managerSessionChk.jsp"%>
<%@ include file="../../color.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	List<Book> booklist = null;
	int number = 0;
	String book_kind = request.getParameter("book_kind");

	BookDao dao = BookDao.getInstance();
	int count = dao.getBookCount();
	int booklistSize = 0;
	if (count > 0) {
		booklist = dao.getBooks(book_kind);
		booklistSize = booklist.size();
	}

	request.setAttribute("booklist", booklist);
	request.setAttribute("bookListSize", booklistSize);
	request.setAttribute("count", count);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=bodyback_c%>">
	<%
		String book_kindName = "";
		switch (book_kind) {
		case "100":
			book_kindName = "문학";
			break;
		case "200":
			book_kindName = "외국어";
			break;
		case "300":
			book_kindName = "컴퓨터";
			break;
		case "all":
			book_kindName = "전체";
			break;
		}
		request.setAttribute("book_kind", book_kind);
		request.setAttribute("book_kindName", book_kindName);
	%>
	<a href="../managerMain.jsp">관리자 메인으로</a> &nbsp;
	<b>
		<!-- <select >
			<option value="100">문학</option>
			<option value="200">외국어</option>
			<option value="300">컴퓨터</option>
			<option value="all">전체</option>
	</select>  -->${book_kindName} 분류의 목록 : <c:if test="${count > 0}">
			<c:if test="${book_kind == all}">
	${count}개
	</c:if>
			<c:if test="${book_kind != all}">
	${bookListSize}개
	</c:if>
		</c:if> </b>
	<table width="100%" align="center">
		<tr>
			<td align="right" bgcolor="<%=value_c%>"><a
				href="bookRegisterForm.jsp">책 등록</a></td>
		</tr>
	</table>
	<c:if test="${count == 0}">
		<table width="100%" border="1" align="center">
			<tr>
				<td align="center">등록된 책이 없습니다</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${count != 0 }">
		<table width="100%" border="1" align="center">
			<tr height="30" bgcolor="<%=value_c%>">
				<th>번호</th>
				<th>책분류</th>
				<th>제목</th>
				<th>가격</th>
				<th>수량</th>
				<th>저자</th>
				<th>출판사</th>
				<th>출판일</th>
				<th>책이미지</th>
				<th>할인율</th>
				<th>등록일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="book" items="${booklist}" varStatus="i">
				<tr height="30">
					<td>${i.count }</td>
					<td>${book.book_kind }</td>
					<td>${book.book_title}</td>
					<td>${book.book_price}</td>
					<td><c:if test="${book.book_count == 0}">
							<font color="red"><%="일시품절"%></font>
						</c:if> <c:if test="${book.book_count > 0}">
					${book.book_count}
					</c:if></td>
					<td>${book.author}</td>
					<td>${book.publishing_com}</td>
					<td>${book.publishing_date}</td>
					<td>${book.book_image}</td>
					<td>${book.discount_rate}</td>
					<td>${book.reg_date}</td>
					<td><a
						href="bookUpdateForm.jsp?book_id=${book.book_id}&book_kind=${book.book_kind}">수정</a></td>
					<td width="50"><a
						href="bookDeleteForm.jsp?book_id=${book.book_id}&book_kind=${book.book_kind}">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<br>
	<a href="../managerMain.jsp">관리자 메인으로</a>
</body>
</html>