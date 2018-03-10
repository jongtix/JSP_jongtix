package QnAservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QnAdao.QnaBoardDao;
import QnAdto.Board;
import controller.CommandProcess;

public class DeleteQnaFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String error = (String) request.getAttribute("error");

		/*
		 * Board board = new Board(); BoardDao dao = BoardDao.getInstance(); board =
		 * dao.getQnaBoard(num);
		 */

		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("error", error);

		return "QnAboard/deleteQnaForm.jsp";
	}

}
