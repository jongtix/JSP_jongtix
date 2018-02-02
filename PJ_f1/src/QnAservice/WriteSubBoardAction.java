package QnAservice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QnAdao.MemberDao;
import QnAdao.SubBoardDao;
import QnAdto.SubBoard;
import controller.CommandProcess;

public class WriteSubBoardAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String sub_writer = request.getParameter("sub_writer");
		String sub_content = request.getParameter("sub_content");
		String sub_password = request.getParameter("sub_password");
		int ref = Integer.parseInt(request.getParameter("num"));

		MemberDao dao = MemberDao.getInstance();
		int result = dao.memberCheck(sub_writer, sub_password); // 회원 체크
		String error = null;
		if (result == 1) {
			SubBoardDao sub = SubBoardDao.getInstance();
			SubBoard subBoard = new SubBoard();
			subBoard.setSub_writer(sub_writer);
			subBoard.setSub_content(sub_content);
			subBoard.setSub_password(sub_password);
			subBoard.setRef(ref);

			result = sub.insertSubBoard(subBoard);
			if (result == 1) {

			} else {
				error = "댓글 입력 실패";
			}
		} else {
			error = "댓글은 회원만 쓸 수 있습니다.";
		}

		String subPageNum = request.getParameter("subPageNum");

		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("error", error);

		return "viewQna.do";
	}

}
