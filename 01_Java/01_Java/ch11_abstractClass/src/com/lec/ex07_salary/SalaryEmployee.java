package com.lec.ex07_salary;

public class SalaryEmployee extends Employee {	
	private int annualSalary;
	
	public SalaryEmployee(String name, int annualSalary) {
		super(name);
		this.annualSalary = annualSalary;
	}

	@Override
	public void computePay() {
		System.out.println("���� : " + getName());
		System.out.println("���� : " + getSalary());
		
		if(getSalary() > 300) {
			annualSalary += (getSalary() * 0.1);
			
			System.out.println("�� : " + (getSalary() * 0.1));
			System.out.println("");
		}
		else {
			System.out.println("�� : ����");
			System.out.println();
		}
	}
}