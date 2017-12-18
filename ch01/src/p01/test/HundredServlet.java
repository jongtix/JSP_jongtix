package p01.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(description = "1부터 100까지 합산하는 서블릿", urlPatterns = { "/HundredServlet" })
public class HundredServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int total = 0;
		int toNum = Integer.parseInt(request.getParameter("num"));
		for (int i = 1; i <= toNum; i++) {
			total = total + i;
		}
		// setContentType()의 설정값은 응답을 받는브라우저의 문자셋에 맞춤
		response.setContentType("text/html;charset = euc-kr");
		// response.setContentType("text/html;charset = utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>Hundred Servlet</title></head><body>");
		out.printf("1부터 " + toNum + "까지의 합은 %d", total);
		out.print("</body></html>");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
