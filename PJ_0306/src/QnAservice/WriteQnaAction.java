package QnAservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QnAdao.BoardDao;
import QnAdto.Board;
import controller.CommandProcess;

public class WriteQnaAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String pageNum = request.getParameter("pageNum");
		Board board = new Board();
		board.setIp(request.getRemoteAddr());
		/*
		 * Run > Run configuration > Arguments에 -Djava.net.preferIPv4Stack="true" 붙여넣기
		 */
		BoardDao dao = BoardDao.getInstance();

		int num = Integer.parseInt(request.getParameter("num"));
		int flag = 1;
		String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int ref = Integer.parseInt(request.getParameter("ref"));
		int re_level = Integer.parseInt(request.getParameter("re_level"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));

		board.setNum(num);
		board.setFlag(flag);
		board.setWriter(writer);
		board.setSubject(subject);
		board.setContent(content);
		board.setEmail(email);
		board.setPassword(password);
		board.setRef(ref);
		board.setRe_step(re_step);
		board.setRe_level(re_level);

		int result = dao.insertQna(board);
		request.setAttribute("result", result);
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);

		return "QnAboard/writeQnaPro.jsp";
	}

}
