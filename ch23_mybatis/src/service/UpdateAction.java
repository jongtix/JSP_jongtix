package service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.MemberDao;
import dto.Member;

public class UpdateAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");

		Member member = new Member();
		MemberDao dao = MemberDao.getInstance();

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String reg_date = request.getParameter("reg_date");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		if (!(password == null && "".equals(password))) {
			Date reg_dt = sdf.parse(reg_date);
			member.setId(id);
			member.setName(name);
			member.setPassword(password);
			member.setReg_date(new java.sql.Date(reg_dt.getTime()));
		} else {
			Date reg_dt = sdf.parse(reg_date);
			member.setId(id);
			member.setName(name);
			member.setReg_date(new java.sql.Date(reg_dt.getTime()));
		}

		int result = dao.updateMemberInfo(member);

		request.setAttribute("result", result);
		return "member/updatePro.jsp";
	}

}
