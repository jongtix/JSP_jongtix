<%@page import="dao.BookDao"%>
<%@page import="java.util.Date"%>
<%@page import="model.Book"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../managerSessionChk.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String saveFolder = "/imageFile";
	String filename = "";
	// 콘텍스트 객체 생성
	ServletContext context = getServletContext();
	// 이미지 저장 폴더 지정
	String realFolder = context.getRealPath(saveFolder);
	int maxSize = 5 * 1024 * 1024; // 5Mb
	String encType = "utf-8";

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
			new DefaultFileRenamePolicy());
	// 전송한 파일 정보 출력
	Enumeration files = multi.getFileNames();
	while (files.hasMoreElements()) {
		// input 태그의 속성이 file인 태그name의 속성값 : 파라미터명
		String name = (String) files.nextElement();
		// 서버에 저장된 파일 이름
		filename = multi.getFilesystemName(name);
	}
	Book book = new Book();
	int book_id = Integer.parseInt(multi.getParameter("book_id"));
	String book_kind = multi.getParameter("book_kind");
	String book_title = multi.getParameter("book_title");
	int book_price = Integer.parseInt(multi.getParameter("book_price"));
	int book_count = Integer.parseInt(multi.getParameter("book_count"));
	String author = multi.getParameter("author");
	String publishing_com = multi.getParameter("publishing_com");
	String publishing_date = multi.getParameter("publishing_date");
	String book_content = multi.getParameter("book_content");
	int discount_rate = Integer.parseInt(multi.getParameter("discount_rate"));

	book.setBook_id(book_id);
	book.setBook_kind(book_kind);
	book.setBook_title(book_title);
	book.setBook_price(book_price);
	book.setBook_count(book_count);
	book.setAuthor(author);
	book.setPublishing_com(publishing_com);
	book.setPublishing_date(publishing_date);
	book.setBook_image(filename);
	book.setBook_content(book_content);
	book.setDiscount_rate(discount_rate);
	book.setReg_date(new java.sql.Date(new Date().getTime()));

	BookDao dao = BookDao.getInstance();
	int result = dao.updateBookInfo(book, book_id);
	if (result > 0) {
		response.sendRedirect("bookList.jsp?book_kind=" + book_kind);
	} else {
		out.print(
				"<script>alert('상품 정보 수정 중 에러 발생, 콘솔 메시지를 확인해주세요.');location.href='bookUpdateForm.jsp';</script>");
	}
%>