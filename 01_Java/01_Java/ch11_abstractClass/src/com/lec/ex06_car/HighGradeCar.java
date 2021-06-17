package com.lec.ex06_car;

public class HighGradeCar extends Car {
	public HighGradeCar(String color, String tire, int displacement) {
		super(color, tire, displacement);
	}
	
	private int tax = 150000; // �⺻ ����
	
	@Override
	public void getSpec() {
		System.out.println("���� : " + getColor());
		System.out.println("Ÿ�̾� : " + getTire());
		System.out.println("��ⷮ : " + getDisplacement());
		
		if(getDisplacement() > 1600) {
			tax += (getDisplacement() - 1600) * 900;
			System.out.println("���� : " + tax);
			System.out.println("======================");
		}
		else {
			System.out.println();
		}
	}
}