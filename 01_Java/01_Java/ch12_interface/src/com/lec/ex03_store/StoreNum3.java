package com.lec.ex03_store;

public class StoreNum3 implements HeadQuarterStore{
	private String name;
	
	public StoreNum3(String name) {
		this.name = name;
	}
	
	@Override
	public String getName() {
		return name;
	}
	
	@Override
	public void kimchi() {
		System.out.println("±èÄ¡Âî°³ : 6,000¿ø");
	}
	
	@Override
	public void budae() {
		System.out.println("ºÎ´ëÂî°³ : 7,000¿ø");
	}
	
	@Override
	public void bibim() {
		System.out.println("ºñºö¹ä : 7,000¿ø");
	}
	
	@Override
	public void sundae() {
		System.out.println("¼ø´ë±¹ : 6,000¿ø");
	}

	@Override
	public void kongki() {
		System.out.println("°ø±â¹ä : 1,000¿ø");
	}
}