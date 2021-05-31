package com.lec.ex06_car;

public abstract class Car {
	/* 데이터 설정 */
	private String color;
	private String tire;
	private int displacement;
	
	/* 생성자 함수 설정 */
	public Car(String color, String tire, int displacement) {
		this.color = color;
		this.tire = tire;
		this.displacement = displacement;
	}
	/* 추상 메소드 */
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