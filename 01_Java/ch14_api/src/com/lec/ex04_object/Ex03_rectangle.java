package com.lec.ex04_object;

public class Ex03_rectangle {
	public static void main(String[] args) throws CloneNotSupportedException {
		Rectangle r1 = new Rectangle(5, 3, "파랑");
		r1.setWidth(10);
		Rectangle r2 = (Rectangle)r1.clone();
		
		if(r1 == r2) {
			System.out.println("r1 = " + r1);
		}
		else {
			System.out.println("r2 = " + r2);
		}
		
		if(r1.equals(r2)) {
			System.out.println("같은 사각형");
		}
		else {
			System.out.println("다른 사각형");
		}
		System.out.println(r1.hashCode());
		System.out.println(r2.hashCode());
		System.out.println(r1.getClass().getName());
	}
}