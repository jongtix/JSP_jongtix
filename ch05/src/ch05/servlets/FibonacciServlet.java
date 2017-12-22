package ch05.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(description = "피보나치 수열 값 구하기", urlPatterns = { "/fibonacciServlet" })
public class FibonacciServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BigInteger[] arr = new BigInteger[100]; // 정수형태의 데이터, Integer보다 범위가 큼

	// 초기화 메소드
	public void init(ServletConfig config) throws ServletException {
		arr[0] = new BigInteger("1");
		arr[1] = new BigInteger("1");
		for (int i = 2; i < arr.length; i++) {
			arr[i] = arr[i - 2].add(arr[i - 1]);
		}
	}

	// 종료 메소드
	public void destroy() {

	}

	// 서비스
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String str1 = request.getParameter("num");
		int num = Integer.parseInt(str1);
		if (num > 100) {
			num = 100; // 최대값을 100으로 설정
		}

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>피보나치 수열</title></head><body>");
		for (int i = 0; i < num; i++) {
			out.print(arr[i] + " ");
		}
		out.print("</body></html>");
	}

	// 서비스
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
