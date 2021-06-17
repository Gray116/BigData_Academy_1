package com.lec.ex3_man;

public class ManMain {
	public static void main(String[] args) {
		Man kim = new Man(30, 180, 63, "010-1234-5678");
		Man kang = new Man(173, 60, "010-1324-5768");
		Man lee = new Man(160, 70);
		
		/* ���� �ڷ����� ������ �迭�� ��Ÿ���� ���� */
		Man[] student = {kim, kang, lee};
		
		lee.setPhoneNum("010-3456-7890");
		student[1].setPhoneNum("010-3546-7980"); // ==kang.setPhoneNum(170, 60, "010-1234-5678"
		
		double bmi = kim.calculateBMI();
		
		for(int idx = 0; idx < student.length; idx++) {
			bmi = student[idx].calculateBMI();
			
			if(bmi > 24.5) {
				System.out.println(student[idx].getPhoneNum() + "�� ���Դϴ�.");
			}
			else {
				System.out.println(student[idx].getPhoneNum() + "�� ���� �ƴմϴ�.");
			}
		}
	} // main
} // class