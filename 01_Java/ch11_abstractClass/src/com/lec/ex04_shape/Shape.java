package com.lec.ex04_shape;

public abstract class Shape { // shape�� ��ӹ޴� �ٸ� Ŭ������ override�� ������
	public void draw() {
		System.out.println("�׷���.");
	}
	
	public abstract void computeArea();
}
