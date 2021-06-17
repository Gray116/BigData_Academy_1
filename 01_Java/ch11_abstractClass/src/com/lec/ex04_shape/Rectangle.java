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
		System.out.println("�簢���� ���̴� " + (garo * sero));
	}
	
	@Override
	public void draw() {
		System.out.print("�簢���� ");
		super.draw();
	}
}
