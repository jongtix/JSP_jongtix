package model;

public class ClothInfo extends ProductInfo {
	// 속성 추가
	private char size;
	private String color;

	public char getSize() {
		return size;
	}

	public void setSize(char size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
}
