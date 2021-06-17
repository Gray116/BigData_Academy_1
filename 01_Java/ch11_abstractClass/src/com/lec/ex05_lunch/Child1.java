package com.lec.ex05_lunch;

public class Child1 extends LunchMenu {
	public Child1(int rice, int bulgogi, int soup, int banana, int milk, int amond) {
		super(rice, bulgogi, soup, banana, milk, amond);
		setTypeString("child1Çü");
	}

	@Override
	public int calculate() {
		return getRice() + getBulgogi() + getSoup() + getBanana() + getAmond();
	}
}