package QnAservice;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import QnAdao.QnaBoardDao;
import QnAdto.Board;
import controller.CommandProcess;

public class WriteQnaAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String pageNum = request.getParameter("pageNum");
		Board board = new Board();
		board.setIp(request.getRemoteAddr());

		QnaBoardDao dao = QnaBoardDao.getInstance();

		int num = Integer.parseInt(request.getParameter("num"));
		int flag = 1;
		String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String email = request.getParameter("email");
		int ref = Integer.parseInt(request.getParameter("ref"));
		int re_level = Integer.parseInt(request.getParameter("re_level"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));

		MultipartRequest mr = null;
		String realFile = request.getSession().getServletContext().getRealPath("/refFiles");
		int maxSize = 5 * 1024 * 1024;
		try {
			mr = new MultipartRequest(request, realFile, maxSize, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String fileName = mr.getFilesystemName("file");
		File file = new File(realFile + "/" + fileName);

		board.setNum(num);
		board.setFlag(flag);
		board.setWriter(writer);
		board.setSubject(subject);
		board.setContent(content);
		board.setEmail(email);
		board.setFilename(fileName);
		board.setRef(ref);
		board.setRe_step(re_step);
		board.setRe_level(re_level);

		int result = dao.insertQna(board);
		
		request.setAttribute("result", result);
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);

		return "QnAboard/writeQnaPro.jsp";
	}

}
