package p01.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(description = "�� �� �̻��� ���� �Ķ���ͷ� �޾Ƽ� ó���ϴ� ����", urlPatterns = { "/TodayMenu" })
public class TodayMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String[] lunches = request.getParameterValues("lunch");
		response.setContentType("text/html;charset = utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>Select & Post </title></head><body>");
		out.print("<center><h3>���� ������</h3></center>");
		for (int i = 0; i < lunches.length; i++) {
			out.print("<br>");
			out.print(lunches[i]);
		}
		out.print("�� �Ծ�߰ڴ�");
		out.print("</body></html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
