package com.lec.ex3_man;

public class Box {
	/* 데이터(private) 설정 */
	private int width;
	private int height;
	private int depth;
	private int volume;
	
	/* 생성자 함수(return 타입 없어야하고 class랑 이름 같아야 함) */
	public Box() {
	}
	
	public Box(int width, int height) {
		this.width = width;
		this.height = height;
	}
	
	public Box(int width, int height, int depth) {
		this.width = width;
		this.height = height;
		this.depth = depth;
	}
	
	/* 메소드 & setter, getter */
	public void calV() {
		if(depth != 0) {
			volume = width * height * depth;
		}
		else {
			volume = width * height;
		}
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}
	
}











