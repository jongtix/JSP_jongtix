package model;

// 부모bean을 상속 받은 자식bean
public class BookInfo extends ProductInfo {
	// 속성 추가
	private Short page;
	private String writer;

	public Short getPage() {
		return page;
	}

	public void setPage(Short page) {
		this.page = page;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
}
