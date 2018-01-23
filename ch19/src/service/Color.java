package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;

public class Color implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String[] color = { "red", "orange", "yellow", "green", "blue", "navy", "violet" };
		int num = (int) (Math.random() * 7);
		request.setAttribute("color", color[num]);
		return "color.jsp";
	}

}
