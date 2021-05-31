package com.lec.ex09_store;

public class StoreNum1 extends HeadQuarterStore {
	public StoreNum1(String name) {
		super(name);
	}
	
	@Override
	public void budae() {
		System.out.println("부대찌개 : 5,000원");
	}
	
	@Override
	public void sundae() {
		System.out.println("순대국 안팔아");
	}
}