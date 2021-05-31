package com.lec.car; // ������(private), �޼ҵ�(public), setter, getter

public class Car { // car��� Ŭ����
	private String color; // �Ӽ���( ~speed����)
	private int cc;
	private int speed;
	
	public void drive() {
		speed = 60;
		System.out.println("�����Ѵ�. ���� �ӵ� " + speed);
	} // drive
	
	public void park() {
		speed = 0;
		System.out.println("�����Ѵ�. ���� �ӵ� " + speed);
	} //park
	
	public void race() {
		speed = 120;
		System.out.println("���̽��Ѵ�. ���� �ӵ� " + speed);
	} //race
	
	/* setter �����*/
	public void setColor(String color) { // setter(��, ��ⷮ, �ӵ�)
		this.color = color; // this - '�� ��ü��'
	}
	public void setCc(int cc) {
		this.cc = cc;
	}
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	
	/* getter �����*/
	public String getColor() { // getter(��, ��ⷮ, �ӵ�)
		return color;
	}
	public int getCc() {
		return cc;
	}
	public int getSpeed() {
		return speed;
	}
} //class














