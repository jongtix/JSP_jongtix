package p01.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/this")
public class NowServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset = utf-8");
		PrintWriter out = resp.getWriter();
		out.print("<html><head><title>�쁽�옱�떆媛꾩�?</title></head><body>");
		out.print("�쁽�옱�떆媛꾩� ");
		out.print(new Date());
		out.print("�엯�땲�떎.");
		out.print("</body></html>");
	}
}
