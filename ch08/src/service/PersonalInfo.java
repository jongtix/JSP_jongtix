package service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;

@WebServlet(description = "회원정보 객체 이동 서블릿", urlPatterns = { "/personalInfo" })
public class PersonalInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Bean(Model)객체 생성
		Customer customer = new Customer();
		customer.setName("임꺽정");
		customer.setGender('남');
		customer.setAge(new Integer(27));

		request.setAttribute("pinfo", customer);

		// 이동 경로 설정
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/CustomerInfoView.jsp");
		dispatcher.forward(request, response);
	}

}
