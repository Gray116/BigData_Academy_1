package com.lec.ex06_toy;

public class Pooh implements IMoveArmLeg {
	public Pooh() {
		System.out.println("������ Ǫ�Դϴ�.");
		canMoveArmLeg();
		System.out.println();
	}
	
	@Override
	public void canMoveArmLeg() {
		System.out.print("�ȴٸ��� ������ �� �ֽ��ϴ�.");
	}
	
	@Override
	public String toString() {
		return "�ȴٸ��� �����̴� ������ Ǫ";
	}
}