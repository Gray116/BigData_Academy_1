package com.lec.car;

public class RectMain {
	public static void main(String[] args) {
		Rect r1 = new Rect(); // r1�� r2 ��ü ����
		Rect r2 = new Rect(); // ��ü���� ���ڴ� ������ 0���� ����
		
		r1.setWidth(5); r1.setHeight(7);
		r2.setWidth(15); r2.setHeight(7);
		
		// ����, ���� ���� ����
		System.out.printf("r1�� ������ : %d, %d\n", r1.getWidth(), r1.getHeight());
		System.out.printf("r2�� ������ : %d, %d\n", r2.getWidth(), r2.getHeight());
		
		System.out.printf("���̴� : %d\n", r1.area());
		System.out.printf("���̴� : %d", r2.area());
	}
}
