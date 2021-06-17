package com.lec.ex3_man;

public class BoxMain {
	public static void main(String[] args) {
		Box r1 = new Box(5, 6, 10);
		Box r2 = new Box(10, 5);
		
		r1.calV();
		r2.calV();
		
		System.out.println("박스 부피 : " + r1.getVolume() );
		System.out.println("직사각형 넓이 : " + r2.getVolume());
	}
}