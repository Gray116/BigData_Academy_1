package com.lec.ex04_actor;

public class Actor implements IPoliceman, IFirefighter, IChef {
	private String name;
	
	public Actor(String name) {
		this.name = name;
	}
	
	/* Chef */
	@Override
	public void makePizza() {
		System.out.println(name + "은(는) 피자를 만들 수 있습니다.");
	}

	@Override
	public void makeSpaghetti() {
		System.out.println(name + "은(는) 스파게티를 만들 수 있습니다.");
	}
	
	/* Firefighter */
	@Override
	public void outFire() {
		System.out.println(name + "은(는) 불을 끌 수 있습니다.");
	}

	@Override
	public void saveMan() {
		System.out.println(name + "은(는) 사람을 구할 수 있습니다.");
	}
	
	/* Policeman */
	@Override
	public void canCatchCriminal() {
		System.out.println(name + "(은)는 범인을 잡을 수 있습니다.");
	}

	@Override
	public void canSearch() {
		System.out.println(name + "(은)는 물건을 찾을 수 있습니다.");
	}
	
	public String getName() {
		return name;
	}
}