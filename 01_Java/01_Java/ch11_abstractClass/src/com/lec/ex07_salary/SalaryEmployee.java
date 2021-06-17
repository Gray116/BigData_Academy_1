package com.lec.ex07_salary;

public class SalaryEmployee extends Employee {	
	private int annualSalary;
	
	public SalaryEmployee(String name, int annualSalary) {
		super(name);
		this.annualSalary = annualSalary;
	}

	@Override
	public void computePay() {
		System.out.println("성함 : " + getName());
		System.out.println("월급 : " + getSalary());
		
		if(getSalary() > 300) {
			annualSalary += (getSalary() * 0.1);
			
			System.out.println("상여 : " + (getSalary() * 0.1));
			System.out.println("");
		}
		else {
			System.out.println("상여 : 없음");
			System.out.println();
		}
	}
}