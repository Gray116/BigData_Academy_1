package com.lec.ex09_store;

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
		System.out.println("���뱹 ���Ⱦ�");
	}
}