package com.lec.ex06_car;

public abstract class Car {
	/* ������ ���� */
	private String color;
	private String tire;
	private int displacement;
	
	/* ������ �Լ� ���� */
	public Car(String color, String tire, int displacement) {
		this.color = color;
		this.tire = tire;
		this.displacement = displacement;
	}
	/* �߻� �޼ҵ� */
	public abstract void getSpec();
	
	/* getter, setter */
	public String getColor() {
		return color;
	}

	public String getTire() {
		return tire;
	}

	public int getDisplacement() {
		return displacement;
	}
}