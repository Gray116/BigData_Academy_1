/* ��Ű����, Ŭ������, ������, ������ �Լ�, �޼ҵ�, setter&getter */
package com.lec.ex1_square;

public class Square {
	private int side;
	
	public Square() { // �������Լ� : return type�� ���� Ŭ������� ���� �Լ�
		System.out.println("�Ű����� ���� ������ �Լ� ȣ���");
	}
	
	public Square(int side) { // �Ű����� �ִ� ������ �Լ��� �뵵 : ������ �ʱ�ȭ
		this.side = side;
		System.out.println("�Ű����� �ִ� ������ �Լ� ȣ���. side �ʱ�ȭ�� ��");
	}
	
	public int area() {
		return side * side;
	}
	
	/* setter */
	public void setSide(int side) {
		this.side = side;
	}
	/* getter */
	public int getSide() {
		return side;
	}
}
