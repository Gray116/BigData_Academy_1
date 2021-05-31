package com.lec.ex11_account;

public class Account {
	private String accountNo;
	private String ownername;
	private int balance; // 22억까지만 표현 가능
	
	public Account() {
		System.out.println("매개변수(전달받은 값)가 없는 생성자 함수");
	}

	public Account(String accountNo, String ownername) {
		this.accountNo = accountNo;
		this.ownername = ownername;
	}

	public Account(String accountNo, String ownername, int balance) {
		this.accountNo = accountNo;
		this.ownername = ownername;
		this.balance = balance;
	}
	
	public void deposit(int money) { // 매개변수 money를 받는 예금 메소드
		balance += money;
		System.out.printf("%s(%s)님, %d원 입금, 잔액 : %d원\n", ownername, accountNo, money, balance);
	}
	
	public void withdraw(int money) {
		if(balance >= money) {
			balance -= money;
			System.out.printf("%s(%s)님, %d원 출금, 잔액 : %d원\n", ownername, accountNo, money, balance);
		}
		else {
			System.out.printf("%s(%s)님, 잔액 %d원으로 출금 불가\n", ownername, accountNo, balance);
		}
	}
	
//	public void printAccount() {
//		System.out.printf("%s(%s)님, 잔액 : %d원\n", ownername, accountNo, balance);
//	}
	
	@Override
	public String toString() {
		return String.format("%s(%s)님, 잔액 : %d원\n", ownername, accountNo, balance);
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getOwnername() {
		return ownername;
	}

	public void setOwnername(String ownername) {
		this.ownername = ownername;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}
}