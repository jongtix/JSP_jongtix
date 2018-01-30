package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;

public class DeleteSubBoardFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
		int sub_num = Integer.parseInt(request.getParameter("sub_num"));
		String pageNum = request.getParameter("pageNum");
		String subPageNum = request.getParameter("subPageNum");
		String error = (String) request.getAttribute("error");

		request.setAttribute("num", num);
		request.setAttribute("sub_num", sub_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("subPageNum", subPageNum);
		request.setAttribute("error", error);

		return "board/deleteSubBoardForm.jsp";
	}

}
