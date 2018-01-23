package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.BoardDao;
import dto.Board;

public class WriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		Board board = new Board();
		String pageNum = (String) request.getAttribute("pageNum");
		board.setIp(request.getRemoteAddr());
		/*
		 * Run > Run configuration > Arguments에 -Djava.net.preferIPv4Stack="true" 붙여넣기
		 */
		BoardDao dao = BoardDao.getInstance();

		int num = Integer.parseInt(request.getParameter("num"));
		String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int ref = Integer.parseInt(request.getParameter("ref"));
		int ref_level = Integer.parseInt(request.getParameter("ref_level"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));

		board.setNum(num);
		board.setWriter(writer);
		board.setSubject(subject);
		board.setContent(content);
		board.setEmail(email);
		board.setPassword(password);
		board.setRef(ref);
		board.setRe_step(re_step);
		board.setRef_level(ref_level);

		int result = dao.insert(board);

		request.setAttribute("result", result);
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);

		return "board/writePro.jsp";
	}

}
