package com.lec.ex04_shape;

public class Rectangle extends Shape {
	private int garo;
	private int sero;
	
	public Rectangle(int garo, int sero) {
		this.garo = garo;
		this.sero = sero;
	}	
	
	@Override
	public void computeArea() {
		System.out.println("사각형의 넓이는 " + (garo * sero));
	}
	
	@Override
	public void draw() {
		System.out.print("사각형을 ");
		super.draw();
	}
}
