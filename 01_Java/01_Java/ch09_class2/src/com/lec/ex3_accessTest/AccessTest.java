package com.lec.ex3_accessTest;

public class AccessTest {
	int defaultMember; // ����Ʈ ���������� ���� ��Ű��������
	protected int protectedMember; // ���� ��Ű���� ��ӹ��� Ŭ�������� ��밡��
	public int publicMember; // �ܺο��� �ƹ���
	
	void defaultMethod() {
		System.out.println("default �޼ҵ�");
	}
	
	protected void protectedMethod() {
		System.out.println("protected �޼ҵ�");
	}
	
	public void publicMethod() {
		System.out.println("public �޼ҵ�");
	}

}
