package com.lec.ex02;

public class TestMain {
	public static void main(String[] args) {
		Child c1 = new Child(); // �߻� Ŭ������ ��ü ���� �Ұ�
		
		c1.method1();
		c1.method2();
		c1.method3();
		
		Super c2 = new Child();
		
		c2.method1();
		c2.method2();
		((Child)c2).method3();
	}
}
