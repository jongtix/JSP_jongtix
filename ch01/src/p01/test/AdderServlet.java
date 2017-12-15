package p01.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdderServlet")
public class AdderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 브라우저에서 넘어오는 파라미터 타입은 문자열
		String str1 = request.getParameter("num1");
		String str2 = request.getParameter("num2");
		String op = request.getParameter("op");
		int num1 = Integer.parseInt(str1);
		int num2 = Integer.parseInt(str2);
		int result = 0;
		switch (op) {
		case "-":
			result = num1 - num2;
			break;
		case "+":
			result = num1 + num2;
			break;
		case "x":
			result = num1 * num2;
			break;
		case "/":
			result = num1 / num2;
			break;
		default:
			break;
		}
		response.setContentType("text/html;charset = utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>두 수의 연산 결과는?</title></head><body>");
		out.print("<h1>두 수의 연산</h1>");
		out.print(op + "<br>");
		out.print(num1 + " " + op + " " + num2 + " = " + result);
		out.print("</body></html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
