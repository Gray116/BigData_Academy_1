package com.lec.ex06_car;

public class LowGradeCar extends Car {
	public LowGradeCar(String color, String tire, int displacement) {
		super(color, tire, displacement);
	}

	private int tax = 100000; // �⺻ ����
	
	@Override
	public void getSpec() {
		System.out.println("���� : " + getColor());
		System.out.println("Ÿ�̾� : " + getTire());
		System.out.println("��ⷮ : " + getDisplacement());
		
		if(getDisplacement() <= 1000) {
			tax += (getDisplacement() - 1000) * 900;
			System.out.println("���� : " + tax);
			System.out.println("======================");
		}
		else {
			System.out.println();
		}
	}
}