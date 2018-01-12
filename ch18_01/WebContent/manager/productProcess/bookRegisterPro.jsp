<%@page import="dao.BookDao"%>
<%@page import="model.Book"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	/* 경로 설정 */
	String realFolder = "";
	String filename = "";
	MultipartRequest imageUp = null;
	String saveFolder = "/imageFile";
	String encType = "utf-8";
	int maxSize = 5 * 1024 * 1024;
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);

	imageUp = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	/* 다중 파일 업로드 처리 */
	Enumeration files = imageUp.getFileNames();
	while (files.hasMoreElements()) {
		String name = (String) files.nextElement();
		filename = imageUp.getFilesystemName(name);
	}

	Book book = new Book();
	String bookKind = imageUp.getParameter("book_kind");
	String bookTitle = imageUp.getParameter("book_title");
	String bookPrice = imageUp.getParameter("book_price");
	String bookCount = imageUp.getParameter("book_count");
	String author = imageUp.getParameter("author");
	String publishingCom = imageUp.getParameter("publishing_com");
	String bookContent = imageUp.getParameter("book_content");
	String discountRate = imageUp.getParameter("discount_rate");
	String publishingDate = imageUp.getParameter("publishing_date");

	book.setBook_kind(bookKind);
	book.setBook_title(bookTitle);
	book.setBook_price(Integer.parseInt(bookPrice));
	book.setBook_count(Integer.parseInt(bookCount));
	book.setAuthor(author);
	book.setPublishing_com(publishingCom);
	book.setPublishing_date(publishingDate);
	book.setBook_image(filename);
	book.setBook_content(bookContent);
	book.setDiscount_rate(Integer.parseInt(discountRate));
	book.setReg_date(new java.sql.Date(new java.util.Date().getTime()));

	BookDao bookProcess = BookDao.getInstance();
	int result = bookProcess.insertBook(book);
	if (result > 0) {
		response.sendRedirect("bookList.jsp?book_kind=" + bookKind);
	} else {
		out.print(
				"<script>alert('데이터 입력 중 에러 발생. 메시지를 확인하세요.');location.href='bookRegisterForm.jsp';</script>");
	}
%>
