// InterfaceEx1 : CONSTANT_NUM, method1()
// InterfaceEx2 : CONSTANT_STRING, method2()

package com.lec.ex01;

public class InterfaceClass implements InterfaceEx1, InterfaceEx2 {

	@Override // �޼ҵ��� ������
	public void method1() {
		System.out.println("1. ���� ������ implements�� Ŭ�������� �մϴ�.");
	}
	
	@Override
	public String  method2() {
		System.out.println("2. ���� ������ implements�� Ŭ�������� �մϴ�.");
		return null;
	}
}