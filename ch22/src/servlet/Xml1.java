package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmpDao;
import dto.Emp;

@WebServlet("/Xml1")
public class Xml1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String job = request.getParameter("job");
			EmpDao dao = EmpDao.getInstance();
			List<Emp> list = dao.selectEmpList(job);
			PrintWriter out = response.getWriter();
			String str = "Empno\tEname\tJob\t\tMGR\tHiredate\tSal\tComm\tDeptno";
			out.println(str);
			out.println();
			for (Emp e : list) {
				if (e.getJob().equals("SALESMAN") || e.getJob().equals("PRESIDENT")) {
					str = e.getEmpno() + "\t" + e.getEname() + "\t" + e.getJob() + "\t" + e.getMgr() + "\t"
							+ e.getHiredate() + "\t" + e.getSal() + "\t" + e.getComm() + "\t" + e.getDeptno();
				} else {
					str = e.getEmpno() + "\t" + e.getEname() + "\t" + e.getJob() + "\t\t" + e.getMgr() + "\t"
							+ e.getHiredate() + "\t" + e.getSal() + "\t" + e.getComm() + "\t" + e.getDeptno();
				}
				out.println(str);
			}
			out.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
