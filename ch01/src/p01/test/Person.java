package p01.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Person")
public class Person extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("pass1");
		String gender = request.getParameter("gender"); // radiobox는 하나의 값만 선택되어서 전달 됨.
		String inotice = request.getParameter("inotice");
		String cnotice = request.getParameter("cnotice");
		String dnotice = request.getParameter("dnotice");
		String job = request.getParameter("job");
		
		if (inotice == null) inotice = "";
		if (cnotice == null) cnotice = "";
		if (dnotice == null) dnotice = "";
		
		response.setContentType("text/html;charset = utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title></title></head><body>");
		out.print("<h1>개인정보</h1>");
		out.print("이름 : " + name + "<p>아이디 : " + id + "<p>");
		out.print("비밀번호 : " + password + "<p>성별 : " + gender + "<p>");
		out.print("메일 수신 여부 : " + inotice + ", " + cnotice + ", " + dnotice + "<p>");
		out.print("직업 : " + job + "<p>"); 
		out.print("</body></html>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
