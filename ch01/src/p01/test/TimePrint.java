package p01.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TimePrint") // 어노테이션 - 3. 특정 기능(WebServlet) 실행
						  // @WebServlet("/주소명")
public class TimePrint extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 문자셋 정의
		resp.setContentType("text/html;charset = utf-8");
		// 출력
		PrintWriter  out = resp.getWriter();
		out.print("<html>");
		out.print("<head><title>현재시간</title><head>");
		out.print("<body>");
		out.print("현재 시간은 ");
		out.print(new Date());
		out.print("입니다.");
		out.print("</body></html>");
	}
}
