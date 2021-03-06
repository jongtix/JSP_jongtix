<%@page import="java.text.NumberFormat"%>
<%@page import="dao.BookDao"%>
<%@page import="model.Book"%><%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="style.css" rel="stylesheet" type="text/css">
<html>
<head>
<title>신간 소개</title>
</head>
<body>
	<%
		Book[] bookLists = null;
		String book_kind = "";
		String book_kindName = "";

		BookDao dao = BookDao.getInstance();

		bookLists = dao.getBooks(5);

		if (request.getParameter("book_kind") == null || request.getParameter("book_kind").equals("")) {
			book_kind = "new";
		} else {
			book_kind = request.getParameter("book_kind");
		}

		request.setAttribute("book_kind", book_kind);
		request.setAttribute("bookLists", bookLists);
		request.setAttribute("book_kindName", book_kindName);

		/* 		for (int i = 1; i <= 3; i++) {
					bookLists = dao.getBooks(i + "00", 2);
					if (bookLists[0].getBook_kind().equals("100")) {
						book_kindName = "문학";
					} else if (bookLists[0].getBook_kind().equals("200")) {
						book_kindName = "외국어";
					} else if (bookLists[0].getBook_kind().equals("300")) {
						book_kindName = "컴퓨터";
					} else {
						book_kindName = "all";
					}
		
				} */
	%>
	<br>
	<font size="+1"><b>신간 목록 <a
			href="list.jsp?book_kind=${book_kind}"><b>--더보기--</b></a>
	</b></font>
	<br>
	<c:forEach var="book" items="${bookLists}">
		<c:if test="${!empty book}">
			<table border="0" width="600" align="center">
				<tr height="30">
					<td rowspan="4" width="100" align="center" valign="middle"><a
						href="shopMain.jsp?pgm=bookContent.jsp?book_id=${book.book_id}&book_kind=${book.book_kind}">
							<img src="../imageFile/${book.book_image}" border="0" width="60"
							height="90">
					</a></td>
					<td width="350"><font size="+1"><b> <a
								href="shopMain.jsp?pgm=bookContent.jsp?book_id=${book.book_id}&book_kind=${book.book_kind}">
									${book.book_title} </a></b></font></td>
					<td rowspan="4" width="100" align="center" valign="middle"><c:if
							test="${book.book_count==0}">
							<b>일시품절</b>
						</c:if> <c:if test="${book.book_count>0}">
							<input type="hidden" name="book_id" value="${book.book_id}">
							<input type="hidden" name="book_image" value="${book.book_image}">
							<input type="hidden" name="book_title" value="${book.book_title}">
							<input type="hidden" name="buy_price" value="${book.book_price}">
							<input type="hidden" name="book_kind" value="${book.book_kind}">
										재고수량: <input type="text" size="5" name="book_count"
								value="${book.book_count}" disabled>권
										수량: <input type="text" size="5" name="buy_count" value="1">권
										<input type="button" value="구매하기"
								onclick="location.href='cartInsert.jsp?book_kind=${book.book_kind}&book_price=${book.book_price}&discount_rate=${book.discount_rate}'">
						</c:if></td>
				<tr height="30">
					<td width="350">출판사:${book.publishing_com}</td>
				</tr>
				<tr height="30">
					<td width="350">저자:${book.author}</td>
				</tr>
				<tr height="30">
					<td width="350">정가: <s><fmt:formatNumber
								value="${book.book_price}" pattern="###,##0" /></s> 원<c:if
							test="${book.discount_rate != 0}">
							<font color="red">${book.discount_rate}% 할인!</font>
						</c:if><br> 판매가: <b><fmt:formatNumber
								value="${book.book_price*(100-book.discount_rate)/100}"
								pattern="###,##0" /> 원</b></td>
				</tr>
			</table>
		</c:if>
	</c:forEach>
</body>
</html>