package com.lec.ex05_lunch;

public abstract class LunchMenu { // Child1과 Child2가 상속받을 예정
	private String typeString;
	private int rice; // 밥 값 
	private int bulgogi; // 불고기 값 
	private int soup; // 국 값 
	private int banana; // 바나나 값 
	private int milk; // 우유 값
	private int amond; // 아몬드 값
	
	public LunchMenu(int rice, int bulgogi, int soup, int banana, int milk, int amond) {
		this.rice = rice;
		this.bulgogi = bulgogi;
		this.soup = soup;
		this.banana = banana;
		this.milk = milk;
		this.amond = amond;
	}
	
	public abstract int calculate(); // 식대 계산 메소드

	public int getRice() {
		return rice;
	}

	public int getBulgogi() {
		return bulgogi;
	}

	public int getSoup() {
		return soup;
	}

	public int getBanana() {
		return banana;
	}

	public int getMilk() {
		return milk;
	}

	public int getAmond() {
		return amond;
	}

	public String getTypeString() {
		return typeString;
	}

	public void setTypeString(String typeString) {
		this.typeString = typeString;
	}
}