<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dao.BookDao"%>
<%@page import="model.Book"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 임시 BookData 생성 프로세스 -->
<%
	for (int i = 1; i < 500; i++) {

		Book book = new Book();

		int r = (int) (Math.random() * 3) + 1;
		book.setBook_kind(r + "00");/* 100,200,300 */
		book.setBook_title("book_title" + i);
		int rp = (int) (Math.random() * 50 + 1);
		int rc = (int) (Math.random() * 30 + 1);
		book.setBook_price(rp * 1000);
		book.setBook_count(rc * 10);
		book.setAuthor("author" + i);
		book.setPublishing_com("publishing_com" + i);
		book.setPublishing_date(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		book.setBook_image("filename" + i);
		book.setBook_content("book_content" + i);
		int rd = (int) (Math.random() * 50);
		book.setDiscount_rate(rd);

		/* java.sql.Date()생성자의 매개변수로 java.util.Date().getTime()를 넘김 */
		book.setReg_date(new java.sql.Date(new Date().getTime()));

		BookDao bookProcess = BookDao.getInstance();
		int result = bookProcess.insertBook(book);
	} //for문 끝.
%>
완료!!
