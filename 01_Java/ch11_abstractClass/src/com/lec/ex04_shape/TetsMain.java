package com.lec.ex04_shape;

public class TetsMain {
	public static void main(String[] args) {
		Shape[] shape = {new Circle(5), new Triangle(3, 4),
											new Rectangle(5, 7)
											};
		
		for(int i = 0; i<shape.length; i++) {
			shape[i].draw();
			shape[i].computeArea();
		}
		System.out.println("===========================");
		
		for(Shape s : shape) {
			s.draw();
			s.computeArea();
		}
	} // main
} // class