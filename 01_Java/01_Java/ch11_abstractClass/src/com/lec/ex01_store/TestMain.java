package com.lec.ex01_store;

public class TestMain {
	public static void main(String[] args) {
		System.out.println("===============================");
		
		StoreNum1 st1 = new StoreNum1(" - ���ð�1ȣ�� - ");
		System.out.println(st1.getName());
		
		st1.kimchi();
		st1.budae();
		st1.bibim();
		st1.sundae();
		st1.kongki();
		System.out.println("===============================");
		
		StoreNum2 st2 = new StoreNum2(" - ���ð�2ȣ�� - ");
		System.out.println(st2.getName());
		
		st2.kimchi();
		st2.budae();
		st2.bibim();
		st2.sundae();
		st2.kongki();
	}
}