package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.MemberDao;
import dto.Member;

public class ListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		MemberDao dao = MemberDao.getInstance();
		List<Member> list = dao.selectMembers();
		request.setAttribute("list", list);

		return "member/list.jsp";
	}

}
