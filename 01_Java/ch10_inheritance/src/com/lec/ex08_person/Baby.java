package com.lec.ex08_person;

public class Baby extends Person {
	public Baby() {
		System.out.println("�Ű�����(���޹޴� ��)�� ���� Baby ������");
	}
	
	public Baby(String name, String character) {
		super(name, character); // �θ���� �����ڸ� ȣ��, �׻� ù��° �ٿ� ���;� ��
		
		System.out.println("�Ű�����(���޹޴� ��)�� �ִ� Baby ������");
	}
	
	public void cry() {
		System.out.println("���� ����");
	}
	
	/* intro override */
	@Override
	public void intro() {
		System.out.println(getName() + "��(��) �Ʊ�� ������ ��� �Ұ��ҰԿ�.");
		super.intro();
	}
}
