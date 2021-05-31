package com.lec.ex0_janmuri;

import constant.Values;

public class ParkingTest {
	private String carNum;
	private int inTime;
	private int outTime;
//	private final int HOURRATE = 2000; // ���ܺ���(���)
	
	public ParkingTest() {
	}
	
	public ParkingTest(String carNum, int inTime) {
		this.carNum = carNum;
		this.inTime = inTime;
		
		System.out.println(carNum + "�� �������");
		System.out.println("* �����ð� : " + inTime + "��");
		System.out.println( "--------------------------"); 
	}

	public void out(int outTime) {
		this.outTime = outTime;
		int fee = (outTime - inTime) * Values.HOURRATE;
		
		System.out.println(carNum + "�� �ȳ���������");
		System.out.println("* �����ð� : " + inTime + "��");
		System.out.println("* �����ð� : " + outTime + "��");
		System.out.println("* ������� : " + fee + "��");
		System.out.println( "--------------------------"); 
	}

	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public int getInTime() {
		return inTime;
	}

	public void setInTime(int inTime) {
		this.inTime = inTime;
	}

	public int getOutTime() {
		return outTime;
	}

	public void setOutTime(int outTime) {
		this.outTime = outTime;
	}
}
