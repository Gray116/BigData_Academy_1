package com.lec.ex02_sawon;

public class TestMain {
	public static void main(String[] args) {
		Sawon[] sawons = {new Sawon("A01", "ȫ�浿", Departments.COMPUTER),
												new Sawon("B01", "��浿", Departments.ACCOUNTING),
												new Sawon("C01", "�̱浿", Departments.DESIGN),
												new Sawon("D01", "�ڱ浿", Departments.HUMANRESOURCES),
												new Sawon("E01", "�ֱ浿", Departments.PLANNING, 2021, 05, 21)
												};
		for(int idx=0; idx<sawons.length; idx++) {
			System.out.println(sawons[idx]);
		}
	}
}