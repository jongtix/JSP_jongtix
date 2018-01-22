package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FileInsert;
import service.SelectList;

@WebServlet("/PdsController")
public class PdsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		int chk = 0;
		String pgm = "";
		// 요청된 경로 및 uri 패턴을 분석
		String uri = request.getRequestURI(); // uri = /ch19/pds/Upload.do
		String path = request.getContextPath(); // /ch19
		String command = uri.substring(path.length() + 1);
		RequestDispatcher rd = null; // 처리 후 이동할 경로

		// command의 경우에 따라 분기
		switch (command) {
		case "pds/Upload.do":
			FileInsert fi = new FileInsert(); // File 저장 클래스
			int result = fi.addFile(request); // File 저장 메소드
			if (result > 0) {
				chk = 0;
				pgm = "uploadOk.jsp";
			} else {
				chk = 1;
				pgm = "uploadForm.jsp";
				request.setAttribute("msg", "업로드 실패");
			}
			break;
		case "pds/List.do":
			SelectList sl = new SelectList();
			sl.selectAll(request);
			chk = 1;
			pgm = "list.jsp";
			break;
		default:
			break;
		}

		if (chk == 0) { // Redirect는 출발점이 다시 browser부터
			response.sendRedirect(pgm);
		} else { // forward는 현재 페이지에서 이동
			rd = request.getRequestDispatcher(pgm); // request에 값을 실어서 이동
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}