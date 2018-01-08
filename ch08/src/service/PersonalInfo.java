package service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;

@WebServlet(description = "�쉶�썝�젙蹂� 媛앹껜 �씠�룞 �꽌釉붾┸", urlPatterns = { "/personalInfo" })
public class PersonalInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Bean(Model)媛앹껜 �깮�꽦
		Customer customer = new Customer();
		customer.setName("�엫爰쎌젙");
		customer.setGender('남');
		customer.setAge(new Integer(27));

		request.setAttribute("pinfo", customer);

		// �씠�룞 寃쎈줈 �꽕�젙
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/CustomerInfoView.jsp");
		dispatcher.forward(request, response);
	}

}
