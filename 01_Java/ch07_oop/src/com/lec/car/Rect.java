package com.lec.car;

public class Rect {
	private int width; // 현재 블록안에서만 사용하기 때문에 private
	private int height;
	
	public int area() {// 메소드 이름 area
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
