package com.lec.ex07_salary;

public class TestMain {
	public static void main(String[] args) {
		Employee[] e1 = {new SalaryEmployee("ȫ�浿", 2800000),
										  new SalaryEmployee("������", 7000000),
										  new SalaryEmployee("�����", 2400000),
//										  new HourlyEmployee("�̾˹�", 160, 30000),
//										  new HourlyEmployee("�ž˹�", 120, 15000)
										  };
		System.out.println("\t���޸���\t\n");
		for(Employee e : e1) {
			e.computePay();
			e.computeIncentive();
		}
	}
}
