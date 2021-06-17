package com.lec.ex09_store;

public class StoreNum3 extends HeadQuarterStore{
	public StoreNum3(String name) {
		super(name);
	}
	
	@Override
	public void kimchi() {
		System.out.println("±èÄ¡Âî°³ : 6,000¿ø");
	}
	
	@Override
	public void budae() {
		System.out.println("±èÄ¡Âî°³ : 7,000¿ø");
	}
	
	@Override
	public void bibim() {
		System.out.println("ºñºö¹ä : 7,000¿ø");
	}
	
	@Override
	public void sundae() {
		System.out.println("¼ø´ë±¹ : 6,000¿ø");
	}
}
