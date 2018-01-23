package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;

public class Gugu implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		request.setAttribute("num1", num1);
		request.setAttribute("num2", num2);
		return "gugu.jsp";
	}

}
