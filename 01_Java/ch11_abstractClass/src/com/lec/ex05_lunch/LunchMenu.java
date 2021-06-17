package com.lec.ex05_lunch;

public abstract class LunchMenu { // Child1�� Child2�� ��ӹ��� ����
	private String typeString;
	private int rice; // �� �� 
	private int bulgogi; // �Ұ�� �� 
	private int soup; // �� �� 
	private int banana; // �ٳ��� �� 
	private int milk; // ���� ��
	private int amond; // �Ƹ�� ��
	
	public LunchMenu(int rice, int bulgogi, int soup, int banana, int milk, int amond) {
		this.rice = rice;
		this.bulgogi = bulgogi;
		this.soup = soup;
		this.banana = banana;
		this.milk = milk;
		this.amond = amond;
	}
	
	public abstract int calculate(); // �Ĵ� ��� �޼ҵ�

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