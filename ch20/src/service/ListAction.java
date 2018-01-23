package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.BoardDao;
import dto.Board;
import dto.PagingBean;
import util.Paging;

public class ListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		BoardDao dao = BoardDao.getInstance();
		int total = dao.getTotal();
		Paging pg = new Paging();
		PagingBean pb = pg.getPaging(request, total);
		List<Board> list = dao.selectList(pb.getStartRow(), pb.getEndRow())

		request.setAttribute("list", list);
		request.setAttribute("pb", pb);
		return "board/list.jsp";
	}

}
