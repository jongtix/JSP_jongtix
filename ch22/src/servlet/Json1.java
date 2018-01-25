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
import dto.Emp2;
import net.sf.json.JSONArray;

@WebServlet("/Json1")
public class Json1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Json1() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String job = request.getParameter("job");
		EmpDao dao = EmpDao.getInstance();
		try {
			List<Emp2> list = dao.selectJson(job);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();

			// JSON객체 생성
			JSONArray json = JSONArray.fromObject(list);
			out.print(json);
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
