package com.lec.ex1_square;

public class SquareMain {
	public static void main(String[] args) {
		Square s1 = new Square();
		Square s2 = new Square(10);
		
		System.out.println("�� ���� ���̴� : " + s1.getSide());
		System.out.println("�� ���� ���̴� : " + s2.getSide());
		
		s1.setSide(9);
		s2.setSide(10);
		
		System.out.println("���̴� : " + s1.area());
		System.out.println("���̴� : " + s2.area());
	}
}
