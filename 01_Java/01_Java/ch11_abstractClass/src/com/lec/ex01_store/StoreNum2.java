package com.lec.ex01_store;

public class StoreNum2 extends HeadQuarterStore {
	public StoreNum2(String name) {
		super(name);
	}
	
	@Override
	public void budae() {
		System.out.println("�δ�� : 5,000��");
	}
	
	@Override
	public void bibim() {
		System.out.println("����� : 5,000��");
	}
	
	@Override
	public void kongki() {
		System.out.println("����� : ����");
	}

	@Override
	public void kimchi() {
		System.out.println("��ġ� : 5,000��");
	}

	@Override
	public void sundae() {
		System.out.println("���뱹 : 5,000��");
	}
}
