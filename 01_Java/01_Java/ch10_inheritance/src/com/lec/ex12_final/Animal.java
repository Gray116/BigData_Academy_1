package com.lec.ex12_final;

public class Animal { // final�� ������ ���̸� �����Ұ�, �޼ҵ忡 ���̸� �������̵� �Ұ�, Ŭ������ ���̸� ��ӱ���
	protected int speed;
	
	public void running() {
		speed += 5;
		System.out.println("�ٰ� �־��. ���� �ӵ� : " + speed);
	}
	
	public final void stop() {
		speed = 0;
		System.out.println("����");
	}
}
