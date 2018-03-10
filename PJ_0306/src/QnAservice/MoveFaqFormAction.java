package QnAservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import QnAdao.BoardDao;
import QnAdao.MemberDao;
import QnAdto.Board;
import controller.CommandProcess;

public class MoveFaqFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println("id: " + id);
		String error = null;
		if (!BoardDao.getInstance().isManager(id)) {
			error = "Manager 권한이 필요합니다.";
			request.setAttribute("error", error);
		}
		Board board = new Board();
		BoardDao dao = BoardDao.getInstance();
		board = dao.getQnaBoard(num);

		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("id", id);

		return "QnAboard/moveFaqForm.jsp";
	}

}
