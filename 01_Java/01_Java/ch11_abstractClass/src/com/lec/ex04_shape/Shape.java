package com.lec.ex04_shape;

public abstract class Shape { // shape를 상속받는 다른 클래스는 override가 강제됨
	public void draw() {
		System.out.println("그려요.");
	}
	
	public abstract void computeArea();
}
