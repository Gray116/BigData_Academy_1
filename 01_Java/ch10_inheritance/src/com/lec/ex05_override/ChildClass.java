package com.lec.ex05_override;

public class ChildClass extends ParentClass {
	public ChildClass() {
		/* ������ �Լ��� �����ε� (�Լ� �ߺ�����) */
		System.out.println("Child �Ű����� ���� ������ �Լ�");
	}
	
	public ChildClass(int i) {
		System.out.println("Child �Ű����� �ִ� ������");
	}
	
	/* �������̵�(�Լ�(�޼ҵ�)�� ������), ������̼� */
	@Override
	public void method1() {
		System.out.println("Child�� method1()");
	}
	
	public void method3() { /* ���Ӱ� �߰��� �Լ�(�޼ҵ�) */
		System.out.println("Child�� method3()");
	}
}