<%@page import="dao.BookDao"%>
<%@page import="model.Book"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../managerSessionChk.jsp"%>
<%@ include file="../../color.jsp"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	List<Book> booklist = null;
	int number = 0;
	String book_kind = request.getParameter("book_kind");

	BookDao dao = BookDao.getInstance();
	int count = dao.getBookCount();
	if (count > 0) {
		booklist = dao.getBooks(book_kind);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	%>
	<a href="../managerMain.jsp">관리자 메인으로</a> &nbsp;
	<b><%=book_kindName%>분류의 목록 : <%
		if (book_kind.equals("all")) {
	%> <%=count%>개 <%
 	} else {
 %> <%=booklist.size()%> 개 <%
 	}
 %> </b>
	<table width="100%" align="center">
		<tr>
			<td align="right" bgcolor="<%=value_c%>"><a
				href="bookRegisterForm.jsp">책 등록</a></td>
		</tr>
	</table>
	<%
		if (count == 0) {
	%>
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
		<%
			for (int i = 0; i < booklist.size(); i++) {
					Book book = (Book) booklist.get(i);
		%>
		<tr height="30">
			<td><%=++number%></td>
			<td><%=book.getBook_kind()%></td>
			<td><%=book.getBook_title()%></td>
			<td><%=book.getBook_price()%></td>
			<td>
				<%
					if (book.getBook_count() <= 0) {
				%> <font color="red"><%="일시품절"%></font> <%
 	} else {
 %><%=book.getBook_count()%> <%
 	}
 %>
			</td>
			<td><%=book.getAuthor()%></td>
			<td><%=book.getPublishing_com()%></td>
			<td><%=book.getPublishing_date()%></td>
			<td><%=book.getBook_image()%></td>
			<td><%=book.getDiscount_rate()%></td>
			<td><%=sdf.format(book.getReg_date())%></td>
			<td><a
				href="bookUpdateForm.jsp?book_id=<%=book.getBook_id()%>&book_kind=<%=book.getBook_kind()%>">수정</a></td>
			<td width="50"><a
				href="bookDeleteForm.jsp?book_id=<%=book.getBook_id()%>&book_kind=<%=book.getBook_kind()%>">삭제</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	%>
	<br>
	<a href="../managerMain.jsp">관리자 메인으로</a>
</body>
</html>