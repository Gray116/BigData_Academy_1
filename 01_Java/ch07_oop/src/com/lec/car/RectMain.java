package com.lec.car;

public class RectMain {
	public static void main(String[] args) {
		Rect r1 = new Rect(); // r1과 r2 객체 생성
		Rect r2 = new Rect(); // 객체안의 숫자는 무조건 0으로 시작
		
		r1.setWidth(5); r1.setHeight(7);
		r2.setWidth(15); r2.setHeight(7);
		
		// 가로, 세로 길이 설정
		System.out.printf("r1의 데이터 : %d, %d\n", r1.getWidth(), r1.getHeight());
		System.out.printf("r2의 데이터 : %d, %d\n", r2.getWidth(), r2.getHeight());
		
		System.out.printf("넓이는 : %d\n", r1.area());
		System.out.printf("넓이는 : %d", r2.area());
	}
}
