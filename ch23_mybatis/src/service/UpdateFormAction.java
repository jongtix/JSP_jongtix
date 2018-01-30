package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.MemberDao;
import dto.Member;

public class UpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String id = request.getParameter("id");
		MemberDao dao = MemberDao.getInstance();
		Member member = dao.getMemberInfo(id);

		request.setAttribute("member", member);

		return "member/updateForm.jsp";
	}

}
