package ch04.server;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(description = "덧셈 서블릿", urlPatterns = { "/newAdderServlet" })
public class NewAdderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String str1 = request.getParameter("num1");
			String str2 = request.getParameter("num2");
			int num1 = Integer.parseInt(str1);
			int num2 = Integer.parseInt(str2);
			int result = num1 + num2;
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<html><head><title>덧셈 프로그램</title></head><body>");
			out.printf("%d + %d = %d", num1, num2, result);
			out.print("</body></html>");
		} catch (NumberFormatException e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("data-error");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
