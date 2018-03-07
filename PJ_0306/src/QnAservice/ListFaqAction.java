package QnAservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QnAdao.BoardDao;
import QnAdto.Board;
import controller.CommandProcess;
import util.Paging;
import util.PageBean;

public class ListFaqAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		BoardDao dao = BoardDao.getInstance();
		int total = dao.getFaqTotal();
		Paging pg = new Paging();
		PageBean pb = pg.getPaging(request, total);
		List<Board> list = dao.selectFaqList(pb.getStartRow(), pb.getEndRow());

		request.setAttribute("total", total);
		request.setAttribute("list", list);
		request.setAttribute("pb", pb);

		return "QnAboard/listFaq.jsp";
	}

}