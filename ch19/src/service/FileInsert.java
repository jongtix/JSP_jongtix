package service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PdsItemDao;
import dto.PdsItem;

public class FileInsert {
	public int addFile(HttpServletRequest request) {
		int result = 0;

		MultipartRequest mr = null;
		String realFile = request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 5 * 1024 * 1024;
		try {
			mr = new MultipartRequest(request, realFile, maxSize, "utf-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}

		String fileName = mr.getFilesystemName("file");
		String description = mr.getParameter("description");
		File file = new File(realFile + "/" + fileName);
		long fileSize = (long) file.length();
		PdsItem pi = new PdsItem();
		pi.setFilename(fileName);
		pi.setDescription(description);
		pi.setFilesize(fileSize);

		PdsItemDao dao = PdsItemDao.getInstance();
		result = dao.insert(pi);
		return result;
	}
}
