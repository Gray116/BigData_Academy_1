package com.lec.car;

public class Rect {
	private int width; // ���� ��Ͼȿ����� ����ϱ� ������ private
	private int height;
	
	public int area() {// �޼ҵ� �̸� area
		return width * height;
	}
	
	/* setter */
	public void setWidth(int width) {
		this.width = width;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	
	/* getter */
	public int getWidth() {
		return width;
	}
	public int getHeight() {
		return height;
	}
}
