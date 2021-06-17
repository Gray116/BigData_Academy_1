// ��Ű�� ����  -> Ŭ���� -> ������(private)-> ������ �Լ� -> method... ������ �Է�
package com.lec.ex4_newException;

public class Account {
	/* ������ */
	private String accountNo;
	private String ownerName;
	private int balance;
	
	/* ������ �Լ�*/
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
	
	/* �޼ҵ� */
	public void deposit(int money) {
		balance += money;
		System.out.printf("\n%d�� �����ϼ̽��ϴ�.\n", money);
	}
	
	public void withdraw(int money) throws Exception {
		if(balance >= money) {
			balance -= money;
			System.out.printf("\n%d�� �����ϼ̽��ϴ�.\n", money);
		}
		else {
			throw new Exception("\n" + money + "���� ����ϱ⿡�� �ܾ�("+ balance +")�� �����մϴ�.");
		}
	}

	public void info() {
		System.out.printf("\n���¹�ȣ�� : %s, �����ָ� : %s, �ܾ��� %d���Դϴ�.\n", accountNo, ownerName, balance);
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










