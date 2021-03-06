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

public class ListQnaAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		BoardDao dao = BoardDao.getInstance();
		int total = dao.getQnaTotal();
		Paging pg = new Paging();
		PagingBean pb = pg.getPaging(request, total);
		List<Board> list = dao.selectQnaList(pb.getStartRow(), pb.getEndRow());

		request.setAttribute("total", total);
		request.setAttribute("list", list);
		request.setAttribute("pb", pb);

		return "board/listQna.jsp";
	}

}
