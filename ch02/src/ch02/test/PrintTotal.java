package ch02.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PrintTotal")
public class PrintTotal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.write(
					"<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
			out.write("<html>\r\n");
			out.write("<head>\r\n");
			out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
			out.write("<title>1부터 100까지의 합</title>\r\n");
			out.write("</head>\r\n");
			out.write("<body>\r\n");
			out.write("\t");

			int total = 0;
			for (int i = 1; i <= 100; i++) {
				total += i;
			}

			out.write("\r\n");
			out.write("\t1부터 100까지의 합은 \r\n");
			out.write("\t");
			out.print(total);
			out.write("\r\n");
			out.write("</body>\r\n");
			out.write("</html>");
		} catch (java.lang.Throwable t) {
			System.out.println(t.getMessage());
		} finally {

		}
	}

}
