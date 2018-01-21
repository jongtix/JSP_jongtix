<%@page import="model.PagingBean"%>
<%@page import="util.Paging"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="dao.BookDao"%>
<%@page import="model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String book_kind = request.getParameter("book_kind");

	String path = request.getContextPath();
	List<Book> bookList = null;
	String book_kindName = "";

	BookDao dao = BookDao.getInstance();

	if (book_kind.equals("100")) {
		book_kindName = "문학 분류의 ";
	} else if (book_kind.equals("200")) {
		book_kindName = "외국어 분류의 ";
	} else if (book_kind.equals("300")) {
		book_kindName = "컴퓨터 분류의 ";
	} else if (book_kind.equals("all")) {
		book_kindName = "전체 ";
	} else if (book_kind.equals("new")) {
		book_kindName = "신간 ";
	}

	String pageNum = request.getParameter("pageNum");
	int pageSize = 10;
	int BLOCKSIZE = 10;
	int count = 0;
	count = dao.getBookCount(book_kind);
	Paging pg = new Paging();
	PagingBean pb = pg.getPaging(pageNum, pageSize, BLOCKSIZE, count);
	bookList = dao.getBooks(book_kind, pb.getStartRow(), pb.getEndRow());

	request.setAttribute("path", path);
	request.setAttribute("book_kind", book_kind);
	request.setAttribute("bookList", bookList);
	request.setAttribute("book_kindName", book_kindName);
	request.setAttribute("startPage", pb.getStartPage());
	request.setAttribute("endPage", pb.getEndPage());
	request.setAttribute("pageCount", pb.getPageCount());
	request.setAttribute("pageSize", pageSize);
	request.setAttribute("BLOCKSIZE", BLOCKSIZE);
%>
<html>
<head>
<title>도서 리스트</title>
<link rel="stylesheet" type="text/css"
	href="https://pm.pstatic.net/css/main_v171221_1.css" />
<link rel="stylesheet" type="text/css"
	href="https://pm.pstatic.net/css/webfont_v170623.css" />
<link rel="stylesheet" type="text/css"
	href="https://ssl.pstatic.net/sstatic/search/pc/css/api_atcmp_170914.css" />
</head>
<body>
	<table width="850">
		<tr>
			<td><img src="../module/logo.jpg" width="150" height="120">
			</td>
			<td><jsp:include page="../module/top.jsp" /></td>
		</tr>
		<tr>
			<td width="150" valign="top"><jsp:include
					page="../module/left.jsp" flush="false" /></td>
			<td width="700" valign="top">

				<h3>${book_kindName}목록</h3> <a href="${path}/shop/shopMain.jsp"><b>메인으로</b></a>
				<c:if test="${!empty bookList}">
					<c:forEach var="book" items="${bookList}">
						<table width="600" align="center">
							<tr height="30">
								<td rowspan="4" width="100" align="center" valign="middle">
									<a
									href="${path}/shop/bookContent.jsp?book_id=${book.book_id}&book_kind=${book_kind}">
										<img src="${path}/imageFile/${book.book_image}" border="0"
										width="60" height="90">
								</a>
								</td>
								<td width="350"><font size="+1"><b> <a
											href="${path}/shop/bookContent.jsp?book_id=${book.book_id}&book_kind=${book_kind}">
												${book.book_title} </a>
									</b></font></td>
								<td rowspan="4" width="100" align="center" valign="middle">
									<c:if test="${book.book_count==0}">
										<b>일시품절</b>
									</c:if> <c:if test="${book.book_count>0}">
										<input type="hidden" name="book_id" value="${book.book_id}">
										<input type="hidden" name="book_image"
											value="${book.book_image}">
										<input type="hidden" name="book_title"
											value="${book.book_title}">
										<input type="hidden" name="buy_price"
											value="${book.book_price}">
										<input type="hidden" name="book_kind"
											value="${book.book_kind}">
										<input type="button" value="구매하기"
											onclick="location.href='cartInsert.jsp?book_kind=${book.book_kind}'">
									</c:if>
								</td>
							</tr>
							<tr height="30">
								<td width="350">출판사:${book.publishing_com}</td>
							</tr>
							<tr height="30">
								<td width="350">저자:${book.author}</td>
							</tr>
							<tr height="30">
								<td width="350">정가: <s><fmt:formatNumber
											value="${book.book_price}" pattern="###,##0" /></s> 원<br>
									판매가: <b><fmt:formatNumber
											value="${book.book_price*(100-book.discount_rate)/100}"
											pattern="###,##0" /></b></td>
							</tr>
						</table>
					</c:forEach>
					<c:if test="${book_kindName != '신간 ' }">
						<br>
						<c:if test="${startPage > BLOCKSIZE}">
							<a
								href="list.jsp?book_kind=${book_kind}&pageNum=${startPage - BLOCKSIZE}">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href="list.jsp?book_kind=${book_kind}&pageNum=${i}">[${i}]</a>
						</c:forEach>
						<c:if test="${endPage < pageCount}">
							<a
								href="list.jsp?book_kind=${book_kind}&pageNum=${startPage + BLOCKSIZE}">[다음]</a>
						</c:if>
					</c:if>
				</c:if> <br>
			</td>
		</tr>
		<tr>
			<td valign="top" align="center"><img src="../module/logo.jpg"
				width="90" height="60"></td>
			<td width="700" valign="top"><jsp:include
					page="../module/bottom.jsp" flush="flase" /></td>
		</tr>
	</table>
</body>
</html>