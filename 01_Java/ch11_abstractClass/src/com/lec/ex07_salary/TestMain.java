package com.lec.ex07_salary;

public class TestMain {
	public static void main(String[] args) {
		Employee[] e1 = {new SalaryEmployee("홍길동", 2800000),
										  new SalaryEmployee("박직원", 7000000),
										  new SalaryEmployee("윤사원", 2400000),
//										  new HourlyEmployee("이알바", 160, 30000),
//										  new HourlyEmployee("신알바", 120, 15000)
										  };
		System.out.println("\t월급명세서\t\n");
		for(Employee e : e1) {
			e.computePay();
			e.computeIncentive();
		}
	}
}
