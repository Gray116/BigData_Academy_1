package com.lec.ex5_momChild;
// Child first = new Child("ù° �ʸ���");
// first.takeMoney(1000);
public class Child {
	private String name;
	MomPouch momPouch = new MomPouch();
	
	/* ������ */
	public Child(String name) {
		this.name = name;
	}
	
	/* �޼ҵ� */
	public void takeMoney(int money) {
		if(MomPouch.money >= money) {
			MomPouch.money -= money;
			
			System.out.println(name + "��" + money + "���� �������� �������� " + MomPouch.money);
		}
		else {
			System.out.println(name + "�� ���� �� ����. ��������" + MomPouch.money);
		}
	}
}