package com.lec.ex01_store;

public class StoreNum1 extends HeadQuarterStore {
	public StoreNum1(String name) {
		super(name);
	}
		
	@Override
	public void budae() {
		System.out.println("�δ�� : 5,000��");
	}
	
	@Override
	public void sundae() {
		System.out.println("���뱹 : X");
	}

	@Override
	public void kimchi() {
		System.out.println("��ġ� : 4,500��");
	}

	@Override
	public void bibim() {
		System.out.println("����� : 6,000��");
	}

	@Override
	public void kongki() {
		System.out.println("����� : 1,000��");
	}
}