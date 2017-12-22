package ch05.servlets;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/greetingServlet")
public class GreetingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter logFile;

	// 초기화 메소드
	public void init(ServletConfig config) throws ServletException {
		try {
			logFile = new PrintWriter(new FileWriter("c:/data/log.txt"));
		} catch (IOException e) {
			throw new ServletException(e);
		}
	}

	// 종료 메소드 - 서버에서 어플리캐이션 제거 or tomcat서버 Stop 시 실행
	public void destroy() {
		if (logFile != null) {
			logFile.close(); // 자원 해제
		}
	}

	// 서비스
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String greeting = "";
		if (name != null && !"".equals(name)) {
			greeting = name + "님 반갑습니다.";
		}
		if (logFile != null) {
			GregorianCalendar now = new GregorianCalendar();
			logFile.printf("%TF %TT - %s %n", now, now, name); // %s : String 타입
		}

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>인사하기</title></head><body>");
		out.print(greeting + "</body></html>");
	}

	// 서비스
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
