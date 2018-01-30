package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.MemberDao;

public class IdCheckAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");

		MemberDao dao = MemberDao.getInstance();
		int result = dao.useCheck(id);

		request.setAttribute("result", result);

		return "idCheck.do";
	}

}
