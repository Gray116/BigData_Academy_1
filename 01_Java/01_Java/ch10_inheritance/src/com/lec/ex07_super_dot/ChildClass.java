package com.lec.ex07_super_dot;

public class ChildClass extends ParentClass {
	private String cStr = "�ڽ� Ŭ����";
	
	public ChildClass() {
		System.out.println("�ڽ� ������");
	}
	
	@Override
	public void getMamiName() {
		System.out.print("�̻� ���� �̻� ");
		// super.�� �θ� Ŭ������ 
		super.getMamiName();
	}
}