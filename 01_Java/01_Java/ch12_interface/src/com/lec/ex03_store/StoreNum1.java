package com.lec.ex03_store;

public class StoreNum1 implements HeadQuarterStore {
	private String name;
	
	public StoreNum1(String name) {
		this.name = name;
	}
	
	@Override
	public String getName() {
		return name;
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