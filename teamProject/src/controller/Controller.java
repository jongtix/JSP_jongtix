package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "*.do", initParams = {
		@WebInitParam(name = "config", value = "/WEB-INF/command.properties") })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<String, Object>();

	@Override
	public void init(ServletConfig config) throws ServletException {
		String conf = config.getInitParameter("config");
		Properties props = new Properties();
		FileInputStream fi = null;
		try {
			String filePath = config.getServletContext().getRealPath(conf);
			fi = new FileInputStream(filePath);
			props.load(fi);// command.properties파일로부터 Properties객체에 저장
		} catch (IOException e) {
			throw new ServletException();
		} finally {
			try {
				if (fi != null)
					fi.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} // finally 끝.
		Iterator keys = props.keySet().iterator();// 키를 iterator에 저장
		while (keys.hasNext()) {
			String command = (String) keys.next();
			String className = props.getProperty(command);
			try {
				Class commandClass = Class.forName(className);
				CommandProcess commandInstance = (CommandProcess) commandClass.newInstance();
				commandMap.put(command, commandInstance);// 명령어와 객체 저장
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}

	public void requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String view = null;
		CommandProcess com = null;
		try {
			String command = request.getRequestURI();
			command = command.substring(request.getContextPath().length() + 1);
			System.out.println(command);
			com = (CommandProcess) commandMap.get(command);
			view = com.requestPro(request, response);
		} catch (Throwable e) {
			throw new ServletException(e);
		}
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestPro(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}