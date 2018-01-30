package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.MemberDao;

public class DeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String view = "";

		MemberDao dao = MemberDao.getInstance();
		int result = dao.useCheck(id, password);
		if (result == 1) {
			result = dao.deleteMember(id);
			if (result > 0) {
				view = "list.do";
			} else {
				request.setAttribute("id", id);
				view = "deleteForm.do";
			}
		} else {
			request.setAttribute("id", id);
			view = "deleteForm.do";
		}
		return view;
	}

}
