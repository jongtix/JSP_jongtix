package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import dao.EmpDao;
import dto.Emp;

@WebServlet("/Xml2")
public class Xml2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String job = request.getParameter("job");
			EmpDao dao = EmpDao.getInstance();
			List<Emp> list = dao.selectEmpList(job);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();

			Element root = new Element("empData"); // <empData></empData>
			for (Emp e : list) {
				Element emp = new Element("emp"); // <empData><emp></emp></empData>

				Element empno = new Element("empno"); // <empData><emp><empno></empno></emp></empData>
				empno.setText(e.getEmpno() + "");// <empData><emp><empno>7369</empno></emp></empData>
				/* empno.setText(String.valueOf(e.getEmpno())); */
				emp.addContent(empno);

				Element ename = new Element("ename");
				ename.setText(e.getEname());
				emp.addContent(ename);

				Element ejob = new Element("job");
				ejob.setText(e.getJob());
				emp.addContent(ejob);

				Element mgr = new Element("mgr");
				mgr.setText(e.getMgr() + "");
				emp.addContent(mgr);

				Element hiredate = new Element("hiredate");
				hiredate.setText(e.getHiredate() + "");
				emp.addContent(hiredate);

				Element sal = new Element("sal");
				sal.setText(e.getSal() + "");
				emp.addContent(sal);

				Element comm = new Element("comm");
				comm.setText(e.getComm() + "");
				emp.addContent(comm);

				Element deptno = new Element("deptno");
				deptno.setText(e.getDeptno() + "");
				emp.addContent(deptno);

				root.addContent(emp);
			}
			Document d = new Document(root);
			XMLOutputter xml = new XMLOutputter();
			Format f = Format.getPrettyFormat();
			f.setEncoding("utf-8");
			xml.setFormat(f);
			xml.output(d, out);
			out.close();

			/*
			 * String str = "Empno\tEname\tJob\t\tMGR\tHiredate\tSal\tComm\tDeptno";
			 * out.println(str); out.println();
			 * 
			 * for (Emp e : list) { if (e.getJob().equals("SALESMAN") ||
			 * e.getJob().equals("PRESIDENT")) { str = e.getEmpno() + "\t" + e.getEname() +
			 * "\t" + e.getJob() + "\t" + e.getMgr() + "\t" + e.getHiredate() + "\t" +
			 * e.getSal() + "\t" + e.getComm() + "\t" + e.getDeptno(); } else { str =
			 * e.getEmpno() + "\t" + e.getEname() + "\t" + e.getJob() + "\t\t" + e.getMgr()
			 * + "\t" + e.getHiredate() + "\t" + e.getSal() + "\t" + e.getComm() + "\t" +
			 * e.getDeptno(); } out.println(str); } out.close();
			 */
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
