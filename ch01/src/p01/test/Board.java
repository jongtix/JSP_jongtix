package p01.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(description = "게시글 작성용 서블릿", urlPatterns = { "/Board" })
public class Board extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 요청으로 넘어온 객체의 문자셋 설정
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		
		response.setContentType("text/html;charset = utf-8"); // html로 보낼 때의 문자셋 설정
		PrintWriter out = response.getWriter();
		out.print("<html><title><head>게시판 내용</head></title><body>");
		out.print("<h1>게시판</h1>");
		out.print("<p>제목 : " + title + "</p>");
		out.print("<p>이름 : " + name + "</p>");
		out.print("<p>내용</p><br><pre>" + content + "</pre></body></html>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
