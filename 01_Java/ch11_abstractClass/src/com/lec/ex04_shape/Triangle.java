package com.lec.ex04_shape;

public class Triangle extends Shape {
	private int w;
	private int h;
	
	public Triangle(int w, int h) {
		this.w = w;
		this.h = h;
	}
	
	@Override
	public void computeArea() {
		System.out.println("»ï°¢ÇüÀÇ ³ĞÀÌ´Â " + (0.5 * w * h));
	}
	
	@Override
	public void draw() {
		System.out.print("»ï°¢ÇüÀ» ");
		super.draw();
	}
}
