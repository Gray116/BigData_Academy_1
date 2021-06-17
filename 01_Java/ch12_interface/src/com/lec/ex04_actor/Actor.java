package com.lec.ex04_actor;

public class Actor implements IPoliceman, IFirefighter, IChef {
	private String name;
	
	public Actor(String name) {
		this.name = name;
	}
	
	/* Chef */
	@Override
	public void makePizza() {
		System.out.println(name + "��(��) ���ڸ� ���� �� �ֽ��ϴ�.");
	}

	@Override
	public void makeSpaghetti() {
		System.out.println(name + "��(��) ���İ�Ƽ�� ���� �� �ֽ��ϴ�.");
	}
	
	/* Firefighter */
	@Override
	public void outFire() {
		System.out.println(name + "��(��) ���� �� �� �ֽ��ϴ�.");
	}

	@Override
	public void saveMan() {
		System.out.println(name + "��(��) ����� ���� �� �ֽ��ϴ�.");
	}
	
	/* Policeman */
	@Override
	public void canCatchCriminal() {
		System.out.println(name + "(��)�� ������ ���� �� �ֽ��ϴ�.");
	}

	@Override
	public void canSearch() {
		System.out.println(name + "(��)�� ������ ã�� �� �ֽ��ϴ�.");
	}
	
	public String getName() {
		return name;
	}
}