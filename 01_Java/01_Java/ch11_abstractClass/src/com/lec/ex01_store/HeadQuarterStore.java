/* 본사 음식점의 가격을 분점에서는 다르게 출력해보기 */

package com.lec.ex01_store;

public abstract class HeadQuarterStore { // 추상 클래스 : 추상메소드가 1개이상 있을 때, override를 강제하게 함. 
	private String name;
	
	public HeadQuarterStore(String name) {
		this.name = name;
	}
	
	public abstract void kimchi(); // 추상 메소드(메소드 정의만 하고 구현부는 없음)
	
	public abstract void budae();
	
	public abstract void bibim();
	
	public abstract void sundae() ;
	
	public abstract void kongki();
	
	public String getName() {
		return name;
	}
}