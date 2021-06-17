package com.lec.ex07_salary;

public abstract class Employee {
	private String name;
	private int salary;
	
	public Employee(String name, int salary) {
		this.name = name;
		this.salary = salary;
	}
	
	public abstract void computePay(); // 급여 계산
	
	public final void computeIncentive() {
		if(salary > 3000000) {
			salary += (salary * 0.1);
		}
		else {}
	}

	public String getName() {
		return name;
	}

	public int getSalary() {
		return salary;
	}
}