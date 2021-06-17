package com.lec.ex4_newException;

public class AccountMain {
	public static void main(String[] args) {		
		Account kim = new Account("A0001", "관우", 50000);
		Account ko = new Account("B0003", "장비");
		Account yi = new Account();
		
//		Account[] client = {kim, ko, yi};
		
		yi.setAccountNo("C0012");
		yi.setOwnerName("유비");
			
		kim.deposit(20000);
		kim.info();

		try {
			ko.withdraw(1);
		} 
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		ko.info();
		
		yi.deposit(10000);
		try {
			yi.withdraw(2000);
		} 
		catch (Exception e1) {
			e1.getMessage();
		}
		
		yi.info();
	}
}
