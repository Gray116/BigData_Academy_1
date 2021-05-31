package com.lec.ex02_sawon;

public class TestMain {
	public static void main(String[] args) {
		Sawon[] sawons = {new Sawon("A01", "홍길동", Departments.COMPUTER),
												new Sawon("B01", "김길동", Departments.ACCOUNTING),
												new Sawon("C01", "이길동", Departments.DESIGN),
												new Sawon("D01", "박길동", Departments.HUMANRESOURCES),
												new Sawon("E01", "최길동", Departments.PLANNING, 2021, 05, 21)
												};
		for(int idx=0; idx<sawons.length; idx++) {
			System.out.println(sawons[idx]);
		}
	}
}