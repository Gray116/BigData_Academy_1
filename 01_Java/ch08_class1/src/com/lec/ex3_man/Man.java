// ��Ű�� -> Ŭ���� -> ������(private)-> ������ �Լ� -> method... ������ �Է�
package com.lec.ex3_man;

public class Man { // ex) Man kim = new Man(30, 170, 60, "010-1234-5678")
	private int age;
	private int height;
	private int weight;
	private String phoneNum;
	
	public Man() { // default ������
	}
	
	public Man(int height, int weight) {
		this.height = height;
		this.weight = weight;
	}
	
	public Man(int height, int weight, String phoneNum) {
		this.height = height;
		this.weight = weight;
		this.phoneNum = phoneNum;
	}
	
	public Man(int age, int height, int weight, String phoneNum) {
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.phoneNum = phoneNum;
	}
	
	public double calculateBMI() {
		double result = weight / ( (height * 0.01) * (height * 0.01) );
		
		return result;
	}
	
	/* setter */
	public void setAge(int age) {
		this.age = age;
	}
	
	public void setWeight(int weight) {
		this.weight = weight;
	}
	
	public void setHeight(int height) {
		this.height = height;
	}
	
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	
	/* getter */
	public int setAge() {
		return age;
	}
	
	public int getWeight() {
		return weight;
	}
	
	public int getHeight() {
		return height;
	}
	
	public String getPhoneNum() {
		return phoneNum;
	}
}



















