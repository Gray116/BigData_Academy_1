package com.lec.ex06_toy;

public class Plane implements IMissle, ILight {
	public Plane() {
		System.out.println("\n������Դϴ�.");
		canMissle();
		canReflect();
		System.out.println();
	}
	
	@Override
	public void canReflect() {
		System.out.println("�Һ� �ݻ� �����մϴ�.");
	}

	@Override
	public void canMissle() {
		System.out.println("�̻����� �� �� �ֽ��ϴ�.");
	}
	
	@Override
	public String toString() {
		return "�Һ��� �̻����� ������ �����";
	}
}