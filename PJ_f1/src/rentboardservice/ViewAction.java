package rentboardservice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.BoardDao;
import dao.ItemDao;
import dao.Sub_boardDao;
import dto.Board;
import dto.Item;
import dto.Sub_board;
import util.PageBean;
import util.Paging;

public class ViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDao bdao = BoardDao.getInstance();
		bdao.updateReadCount(num);
		Board board = bdao.getBoard(num);
		
		ItemDao idao = ItemDao.getInstance();
		Item item = idao.getItem(num);
		
		//댓글받아오기
		Sub_boardDao subdao = Sub_boardDao.getInstance();
		List<Sub_board> sub_board = subdao.getSubboard(num);
		//댓글 순서
		int total =subdao.getTotal(num);
		Paging pg = new Paging();
		
		PageBean pb = pg.getPaging(request, total);
		List<Sub_board> list = subdao.selectList(pb.getStartRow(),pb.getEndRow(),num);
		
		request.setAttribute("pb", pb);
		request.setAttribute("total", total);
		request.setAttribute("list", list);
		request.setAttribute("sub_board", sub_board);
		request.setAttribute("item", item);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board", board);
		return "board/view.jsp?num=${num}&pageNum=${pageNum}";
	}

}
