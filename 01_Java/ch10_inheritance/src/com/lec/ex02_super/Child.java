package com.lec.ex02_super;

public class Child extends SuperIJ {
	private int total;
	
	public Child() {
		/* �ظ��ϸ� ����� ���� �� */
		System.out.println("�Ű����� ���� Child ������ �Լ�");
	}
	
	public Child(int i, int j) {
		/* main �Լ����� Child child = new Child(1,2)�� ���� ���� */
		setI(i); 
		setJ(j);
		
		System.out.println("�Ű����� �ִ� Child ������ �Լ�");
	}
	
	public void sum() {
		total = getI() + getJ(); //total = i + j;
		
		System.out.println("�� ��ü�� total���� " + total);
	}
}