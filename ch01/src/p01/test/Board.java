package p01.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(description = "�Խñ� �ۼ��� ����", urlPatterns = { "/Board" })
public class Board extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // ��û���� �Ѿ�� ��ü�� ���ڼ� ����
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		
		response.setContentType("text/html;charset = utf-8"); // html�� ���� ���� ���ڼ� ����
		PrintWriter out = response.getWriter();
		out.print("<html><title><head>�Խ��� ����</head></title><body>");
		out.print("<h1>�Խ���</h1>");
		out.print("<p>���� : " + title + "</p>");
		out.print("<p>�̸� : " + name + "</p>");
		out.print("<p>����</p><br><pre>" + content + "</pre></body></html>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
