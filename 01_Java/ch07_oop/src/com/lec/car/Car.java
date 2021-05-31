package com.lec.car; // 데이터(private), 메소드(public), setter, getter

public class Car { // car라는 클래스
	private String color; // 속성들( ~speed까지)
	private int cc;
	private int speed;
	
	public void drive() {
		speed = 60;
		System.out.println("운전한다. 지금 속도 " + speed);
	} // drive
	
	public void park() {
		speed = 0;
		System.out.println("주차한다. 지금 속도 " + speed);
	} //park
	
	public void race() {
		speed = 120;
		System.out.println("레이싱한다. 지금 속도 " + speed);
	} //race
	
	/* setter 만들기*/
	public void setColor(String color) { // setter(색, 배기량, 속도)
		this.color = color; // this - '내 객체의'
	}
	public void setCc(int cc) {
		this.cc = cc;
	}
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	
	/* getter 만들기*/
	public String getColor() { // getter(색, 배기량, 속도)
		return color;
	}
	public int getCc() {
		return cc;
	}
	public int getSpeed() {
		return speed;
	}
} //class














