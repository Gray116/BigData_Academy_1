package com.lec.ex3_man;

public class Box {
	/* ������(private) ���� */
	private int width;
	private int height;
	private int depth;
	private int volume;
	
	/* ������ �Լ�(return Ÿ�� ������ϰ� class�� �̸� ���ƾ� ��) */
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
	
	/* �޼ҵ� & setter, getter */
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











