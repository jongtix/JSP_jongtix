package QnAservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QnAdto.Board;
import controller.CommandProcess;

public class WriteQnaFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Board board = new Board();
		int num = 0, flag = 0, ref = 0, re_step = 0, re_level = 0;
		String pageNum = request.getParameter("pageNum");
		if (request.getParameter("num") != null) { // 답글일 경우
			num = Integer.parseInt(request.getParameter("num"));
			flag = Integer.parseInt(request.getParameter("flag"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
		}
		board.setNum(num);
		board.setFlag(flag);
		board.setRef(ref);
		board.setRe_step(re_step);
		board.setRe_level(re_level);

		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);

		return "QnAboard/writeQnaForm.jsp";
	}

}
