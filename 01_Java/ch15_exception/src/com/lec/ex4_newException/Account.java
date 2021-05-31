// 패키지 생성  -> 클래스 -> 데이터(private)-> 생성자 함수 -> method... 순으로 입력
package com.lec.ex4_newException;

public class Account {
	/* 데이터 */
	private String accountNo;
	private String ownerName;
	private int balance;
	
	/* 생성자 함수*/
	public Account() { 
	}
	
	public Account(String accountNo, String ownerName) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
	}
	
	public Account(String accountNo, String ownerName, int balance) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		this.balance = balance;
	}
	
	/* 메소드 */
	public void deposit(int money) {
		balance += money;
		System.out.printf("\n%d원 예금하셨습니다.\n", money);
	}
	
	public void withdraw(int money) throws Exception {
		if(balance >= money) {
			balance -= money;
			System.out.printf("\n%d원 인출하셨습니다.\n", money);
		}
		else {
			throw new Exception("\n" + money + "원을 출금하기에는 잔액("+ balance +")이 부족합니다.");
		}
	}

	public void info() {
		System.out.printf("\n계좌번호는 : %s, 예금주명 : %s, 잔액은 %d원입니다.\n", accountNo, ownerName, balance);
	}
	
	/* setter */
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	
	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	/* getter */
	public String getAccountNo() {
		return accountNo;
	}
	
	public String getOwnerName() {
		return ownerName;
	}
	
	public int getBalance() {
		return balance;
	}
}










