package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.BoardDao;
import dto.Board;

public class UpdateQnaAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		BoardDao dao = BoardDao.getInstance();
		Board board = new Board();
		int result = dao.useCheck(num, password);
		String view = "";
		String error = "";
		if (result == 1) {
			board.setNum(num);
			board.setSubject(subject);
			board.setEmail(email);
			board.setContent(content);
			result = dao.updateBoard(board);
			if (result > 0) {
				view = "listQna.do";
			} else {
				error = "업데이트 실패";
				view = "updateQnaForm.do";
			}
		} else {
			error = "비밀번호를 확인해주세요.";
			view = "updateQnaForm.do";
		}

		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("error", error);

		return view;
	}

}
