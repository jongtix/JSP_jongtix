package util;

import javax.servlet.http.HttpServletRequest;

import dto.PagingBean;

public class Paging {
	public PagingBean getPaging(HttpServletRequest request, int total) {
		PagingBean pb = new PagingBean();

		String pageNum = request.getParameter("pageNum");
		/* 파라미터로 넘어온 페이지번호값이 없으면 무조건 page를 1로 설정 */
		if (pageNum == null || "".equals(pageNum))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		/* 현재페이지의 시작번호 */
		int startRow = (currentPage - 1) * pb.getPAGESIZE() + 1;
		/* 현재페이지의 마지막 번호 */
		int endRow = currentPage * pb.getPAGESIZE();// 페이지 당 끝번호가 10,20,30...으로 끝남
		/* 도서리스트 번호 와 순서 초기화 */
		int number = 0;

		/* 페이지 navigation 부분 */
		int pageCount = (int) Math.ceil((double) total / pb.getPAGESIZE());
		int startPage = (int) ((currentPage - 1) / pb.getBLOCKSIZE()) * pb.getBLOCKSIZE() + 1;// 현재페이지가 속한 시작번호
		int endPage = 0;
		if (pageCount < pb.getBLOCKSIZE() || pageCount < (startPage + pb.getBLOCKSIZE() - 1)) {
			endPage = pageCount;
		} else {
			endPage = startPage + pb.getBLOCKSIZE() - 1;// 한 화면에 보여지는 페이지 끝 번호
		}
		int rowNum = total - startRow + 1;

		pb.setPageNum(pageNum);
		pb.setCurrentPage(currentPage);
		pb.setStartRow(startRow);
		pb.setEndRow(endRow);
		pb.setPageCount(pageCount);
		pb.setStartPage(startPage);
		pb.setEndPage(endPage);
		pb.setRowNum(rowNum);

		return pb;
	}
}