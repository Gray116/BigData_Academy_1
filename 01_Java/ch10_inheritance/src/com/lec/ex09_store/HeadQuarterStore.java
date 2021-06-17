/* 본사 음식점의 가격을 분점에서는 다르게 출력해보기 */

package com.lec.ex09_store;

public class HeadQuarterStore {
	private String name;
	
	public HeadQuarterStore(String name) {
		this.name = name;
	}
	
	public void kimchi() {
		System.out.println("김치찌개 : 5,000원");
	}
	
	public void budae() {
		System.out.println("부대찌개 : 6,000원");
	}
	
	public void bibim() {
		System.out.println("비빔밥 : 6,000원");
	}
	
	public void sundae() {
		System.out.println("순대국  : 5,000원");
	}
	
	public void kongki() {
		System.out.println("공기밥 : 1,000원");
	}
	
	public String getName() {
		return name;
	}
}