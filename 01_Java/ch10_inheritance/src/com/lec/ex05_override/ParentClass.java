/* �������̵�(�Լ��� ������ : ��ӹ޴� Ŭ������ �Լ��� ������ */
/* �����ε� (�Լ� �ߺ� ���� : �Ű������� Ÿ���̳� ������ �޸� �Ͽ� ���� �̸��� �Լ��� �ߺ��ؼ� ���� */
package com.lec.ex05_override;

public class ParentClass {
	public ParentClass() {
		System.out.println("Parent �Ű����� ���� ������ �Լ�");
	}
	
	public ParentClass(int i) {
		System.out.println("Parent �Ű����� �ִ� ������ �Լ�");
	}
	
	public void method1() {
		System.out.println("Parent�� method1()");
	}
	
	public void method2() {
		System.out.println("Parent�� method2()");
	}
}
