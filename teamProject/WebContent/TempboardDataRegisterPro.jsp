<%@page import="dto.SubBoard"%>
<%@page import="dao.SubBoardDao"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@page import="sun.security.krb5.Confounder"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 임시 boardData 생성 프로세스 -->
<%
	for (int i = 1; i < 111; i++) {
		SubBoard sub = new SubBoard();
		sub.setSub_writer("MemberId" + i);
		sub.setSub_content("내용" + i);
		sub.setSub_password("1111");
		sub.setRef(93);

		SubBoardDao d = SubBoardDao.getInstance();
		d.insertSubBoard(sub);

		Board board = new Board();

		int r = (int) (Math.random() * 4);
		board.setFlag(r);
		board.setWriter("writer" + i);
		board.setSubject("제목" + i);
		board.setContent("내용" + i);

		String[] email = { "naver.com", "daum.net", "gmail.com", "nate.com" };
		r = (int) (Math.random() * 4);
		board.setEmail("email" + i + "@" + email[r]);

		board.setReadcount(0);
		board.setPassword("1111");
		board.setRe_step(0);
		board.setRe_level(0);
		board.setIp("127.0.0.1");

		/* java.sql.Date()생성자의 매개변수로 java.util.Date().getTime()를 넘김 */
		Date conFromDate = new Date();
		long ttl = conFromDate.parse("Jan 1, 1990 0:0:0");
		long now = conFromDate.getTime();
		long randomDate = (long) (Math.random() * (now - ttl)) + ttl;
		board.setReg_date(new java.sql.Date(new Date(randomDate).getTime()));

		BoardDao dao = BoardDao.getInstance();
		int result = dao.insertQna(board);
	} //for문 끝.
%>
완료!!
