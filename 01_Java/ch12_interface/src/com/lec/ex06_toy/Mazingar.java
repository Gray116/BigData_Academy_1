package com.lec.ex06_toy;

public class Mazingar implements IMissle, IMoveArmLeg {
	public Mazingar() {
		System.out.println("\n��¡�� �峭���Դϴ�.");
		canMissle();
		canMoveArmLeg();
	}

	@Override
	public void canMissle() {
		System.out.println("�̻����� �� �� �ֽ��ϴ�.");
	}
	
	@Override
	public void canMoveArmLeg() {
		System.out.println("�ȴٸ��� ������ �� �ֽ��ϴ�.");
	}
	
	@Override
	public String toString() {
		return "�̻����� ��� �ȴٸ��� �����̴� ��¡��";
	}
}