package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.MemberDao;
import dto.Member;

public class JoinAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");

		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		member.setName(name);

		MemberDao dao = MemberDao.getInstance();
		int result = dao.insertMember(member);
		String view = "";
		if (result > 0) {
			view = "list.do";
		} else {
			view = "joinForm.do";
		}

		return view;
	}

}
