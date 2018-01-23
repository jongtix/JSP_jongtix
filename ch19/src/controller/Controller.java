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

@WebServlet(urlPatterns = "*.do", initParams = { @WebInitParam(name = "config", value = "/WEB-INF/config.properties") })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<>(); // 명령어에 해당하는 객체들을 저장하기 위한 Map 생성

	/* 서블릿 호출시 가장 먼저 실행되는 메소드 init() */
	@Override
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("config"); // web.xml에서 properties 파일 읽어오기
		Properties pr = new Properties();
		FileInputStream f = null;
		try {
			String configFilePath = config.getServletContext().getRealPath(props);
			f = new FileInputStream(configFilePath);
			pr.load(f); // config.properties 파일의 정보를 Properties 객체에 저장
		} catch (IOException e) {
			throw new ServletException();
		} finally {
			try {
				if (f != null)
					f.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}

		Iterator keyIterator = pr.keySet().iterator();
		while (keyIterator.hasNext()) {
			String command = (String) keyIterator.next();
			String className = pr.getProperty(command);
			try {
				Class commandClass = Class.forName(className);
				Object commandInstance = commandClass.newInstance();
				commandMap.put(command, commandInstance);
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}

	// uri요청을 분석해서 해당 작업 분기 처리하는 메소드
	public void requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String view = null;
		CommandProcess comm = null; // 객체 인터페이스 선언
		try {
			String command = request.getRequestURI(); // 요청 uri
			command = command.substring(request.getContextPath().length() + 1); // command 추출
			comm = (CommandProcess) commandMap.get(command); // Promotion
			System.out.println("command = " + command);
			view = comm.requestPro(request, response); // 결과 처리 후 이동 경로 리턴.
		} catch (Throwable e) {
			throw new ServletException(e);
		}
		RequestDispatcher rd = request.getRequestDispatcher(view); // 이동할 경로
		rd.forward(request, response); // 이동
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
