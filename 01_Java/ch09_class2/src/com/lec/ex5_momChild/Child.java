package com.lec.ex5_momChild;
// Child first = new Child("첫째 똘만이");
// first.takeMoney(1000);
public class Child {
	private String name;
	MomPouch momPouch = new MomPouch();
	
	/* 생성자 */
	public Child(String name) {
		this.name = name;
	}
	
	/* 메소드 */
	public void takeMoney(int money) {
		if(MomPouch.money >= money) {
			MomPouch.money -= money;
			
			System.out.println(name + "가" + money + "원을 가져가서 엄마돈은 " + MomPouch.money);
		}
		else {
			System.out.println(name + "은 돈을 못 받음. 엄마돈은" + MomPouch.money);
		}
	}
}