package com.lec.ex6_quiz;

public class Customer {
	private String name;
	private String tel;
	private String birth;
	private String address;
	
	public Customer() {}
	public Customer(String name, String tel, String birth, String address) {
		this.name = name;
		this.tel = tel;
		this.birth = birth;
		this.address = address;
	}
	
	@Override
	public String toString() {
		return name + "\t" + tel + "\t" + birth + "»ý\t" + address;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
}