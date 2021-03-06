package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.BoardDao;
import dao.SubBoardDao;
import dto.Board;
import dto.SubBoard;
import util.Paging;
import util.PagingBean;

public class ViewQnaAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String subPageNum = request.getParameter("subPageNum");

		BoardDao dao = BoardDao.getInstance();
		dao.updateReadCount(num);
		Board board = dao.getQnaBoard(num);

		SubBoardDao subDao = SubBoardDao.getInstance();
		int total = subDao.getSubBoardTotal(num);
		Paging pg = new Paging();
		PagingBean pb = pg.getSubPaging(request, total);
		List<SubBoard> subList = subDao.selectSubBoardList(num, pb.getStartRow(), pb.getEndRow());

		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board", board);
		request.setAttribute("subList", subList);
		request.setAttribute("total", total);
		request.setAttribute("pb", pb);
		request.setAttribute("subPageNum", pb.getPageNum());

		return "board/viewQna.jsp";
	}

}
