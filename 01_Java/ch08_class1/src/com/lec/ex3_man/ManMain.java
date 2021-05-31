package com.lec.ex3_man;

public class ManMain {
	public static void main(String[] args) {
		Man kim = new Man(30, 180, 63, "010-1234-5678");
		Man kang = new Man(173, 60, "010-1324-5768");
		Man lee = new Man(160, 70);
		
		/* 동일 자료형의 집합은 배열로 나타내면 좋다 */
		Man[] student = {kim, kang, lee};
		
		lee.setPhoneNum("010-3456-7890");
		student[1].setPhoneNum("010-3546-7980"); // ==kang.setPhoneNum(170, 60, "010-1234-5678"
		
		double bmi = kim.calculateBMI();
		
		for(int idx = 0; idx < student.length; idx++) {
			bmi = student[idx].calculateBMI();
			
			if(bmi > 24.5) {
				System.out.println(student[idx].getPhoneNum() + "님 비만입니다.");
			}
			else {
				System.out.println(student[idx].getPhoneNum() + "님 비만이 아닙니다.");
			}
		}
	} // main
} // class