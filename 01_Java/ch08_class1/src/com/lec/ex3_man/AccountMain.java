package com.lec.ex3_man;

public class AccountMain {
	public static void main(String[] args) {		
		Account kim = new Account("A0001", "����", 50000);
		Account ko = new Account("B0003", "���");
		Account yi = new Account();
		
//		Account[] client = {kim, ko, yi};
		
		yi.setAccountNo("C0012");
		yi.setOwnerName("����");
			
		kim.deposit(5000);
		kim.info();
		
		ko.withdraw(2);
		ko.info();
		
		yi.deposit(10000);
		yi.withdraw(2000);
		yi.info();

	}
}
