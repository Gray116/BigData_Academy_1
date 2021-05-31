package com.lec.ex03_store;

public class StoreNum2 implements HeadQuarterStore {
	private String name;
	
	public StoreNum2(String name) {
		this.name = name;
	}
	
	@Override
	public String getName() {
		return name;
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
		System.out.println("°ø±â¹ä : ¹«·á");
	}

	@Override
	public void kimchi() {
		System.out.println("±èÄ¡Âî°³ : 5,000¿ø");
	}

	@Override
	public void sundae() {
		System.out.println("¼ø´ë±¹ : 5,000¿ø");
	}
}