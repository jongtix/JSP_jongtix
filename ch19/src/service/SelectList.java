package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.PdsItemDao;
import dto.PdsItem;

public class SelectList {
	public void selectAll(HttpServletRequest request) {
		PdsItemDao dao = PdsItemDao.getInstance();
		List<PdsItem> list = dao.selectAll();
		request.setAttribute("list", list);
	}
}
