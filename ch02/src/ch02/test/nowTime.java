package ch02.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/nowTime")
public class nowTime extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.write("\r\n");
			out.write("\r\n");
			out.write(
					"<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
			out.write("<html>\r\n");
			out.write("<head>\r\n");
			out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
			out.write("<title>날짜와 시간</title>\r\n");
			out.write("</head>\r\n");
			out.write("<body>\r\n");
			out.write("\t");

			GregorianCalendar now = new GregorianCalendar();
			String date = String.format("%TF", now);
			String time = String.format("%TT", now);

			out.write("\r\n");
			out.write("\t오늘의 날짜 :\r\n");
			out.write("\t");
			out.print(date);
			out.write("<br> 현재 시간 :\r\n");
			out.write("\t");
			out.print(time);
			out.write("\r\n");
			out.write("</body>\r\n");
			out.write("</html>");
		} catch (java.lang.Throwable t) {
			System.out.println(t.getMessage());
		} finally {
		}
	}

}
