package com.lec.ex1_square;

public class SquareMain {
	public static void main(String[] args) {
		Square s1 = new Square();
		Square s2 = new Square(10);
		
		System.out.println("한 변의 길이는 : " + s1.getSide());
		System.out.println("한 변의 길이는 : " + s2.getSide());
		
		s1.setSide(9);
		s2.setSide(10);
		
		System.out.println("넓이는 : " + s1.area());
		System.out.println("넓이는 : " + s2.area());
	}
}
