package fileupload;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		String contentType = request.getContentType();
		if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
			printPartInfo(request, out);
		} else {
			out.print("multipart가 아님.");
		}
		out.print("</body></html>");
	}

	private void printPartInfo(HttpServletRequest request, PrintWriter out) throws ServletException, IOException {
		Collection<Part> parts = request.getParts();
		for (Part part : parts) {
			out.print("<br>name = " + part.getName());
			String contentType = part.getContentType();
			out.print("<br>contentType = " + contentType);
			if (part.getHeader("Content-Disposition").contains("filename = ")) {
				out.print("<br>size = " + part.getSize());
				String filename = part.getSubmittedFileName();
				out.print("<br>filename = " + filename);
				part.delete();
			} else {
				String value = request.getParameter(part.getName());
				out.print("<br>value = " + value);
			}
			out.print("<hr>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
