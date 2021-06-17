package com.lec.ex09_store;

public class StoreNum2 extends HeadQuarterStore {
	public StoreNum2(String name) {
		super(name);
	}
	
	@Override
	public void budae() {
		System.out.println("ºÎ´ëÂî°³ : 5,000¿ø");
	}
	
	@Override
	public void bibim() {
		System.out.println("ºñºö¹ä : 5,000¿ø");
	}
	
	@Override
	public void kongki() {
		System.out.println("°ø±â¹ä ¹«·á");
	}
}
