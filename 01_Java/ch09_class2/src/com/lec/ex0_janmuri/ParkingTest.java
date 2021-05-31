package com.lec.ex0_janmuri;

import constant.Values;

public class ParkingTest {
	private String carNum;
	private int inTime;
	private int outTime;
//	private final int HOURRATE = 2000; // 종단변수(상수)
	
	public ParkingTest() {
	}
	
	public ParkingTest(String carNum, int inTime) {
		this.carNum = carNum;
		this.inTime = inTime;
		
		System.out.println(carNum + "님 어서오세요");
		System.out.println("* 입차시간 : " + inTime + "시");
		System.out.println( "--------------------------"); 
	}

	public void out(int outTime) {
		this.outTime = outTime;
		int fee = (outTime - inTime) * Values.HOURRATE;
		
		System.out.println(carNum + "님 안녕히가세요");
		System.out.println("* 입차시간 : " + inTime + "시");
		System.out.println("* 출차시간 : " + outTime + "시");
		System.out.println("* 주차요금 : " + fee + "원");
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
