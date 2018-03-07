package rentboardservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.BoardDao;
import dao.ItemDao;
import dao.Sub_boardDao;
import dto.Board;
import dto.Item;
import dto.Sub_board;

public class Sub_writeAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String sub_writer = request.getParameter("sub_writer");
		String sub_content = request.getParameter("sub_content");
		String sub_password = request.getParameter("sub_password");

		BoardDao bdao = BoardDao.getInstance();
		bdao.updateReadCount(num);
		Board board = bdao.getBoard(num);

		ItemDao idao = ItemDao.getInstance();
		Item item = idao.getItem(num);

		Sub_boardDao subdao = Sub_boardDao.getInstance();
		Sub_board sub_board = new Sub_board();

		sub_board.setSub_num(num);
		sub_board.setSub_writer(sub_writer);
		sub_board.setSub_content(sub_content);
		sub_board.setSub_password(sub_password);
		sub_board.setRef(board.getNum());

		int result = subdao.insertSubboard(sub_board);

		request.setAttribute("result", result);
		request.setAttribute("item", item);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board", board);
		return "board/subBoardPro.jsp";
	}

}
