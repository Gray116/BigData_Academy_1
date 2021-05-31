package com.lec.ex11_account;

public class Account {
	private String accountNo;
	private String ownername;
	private int balance; // 22������� ǥ�� ����
	
	public Account() {
		System.out.println("�Ű�����(���޹��� ��)�� ���� ������ �Լ�");
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
	
	public void deposit(int money) { // �Ű����� money�� �޴� ���� �޼ҵ�
		balance += money;
		System.out.printf("%s(%s)��, %d�� �Ա�, �ܾ� : %d��\n", ownername, accountNo, money, balance);
	}
	
	public void withdraw(int money) {
		if(balance >= money) {
			balance -= money;
			System.out.printf("%s(%s)��, %d�� ���, �ܾ� : %d��\n", ownername, accountNo, money, balance);
		}
		else {
			System.out.printf("%s(%s)��, �ܾ� %d������ ��� �Ұ�\n", ownername, accountNo, balance);
		}
	}
	
//	public void printAccount() {
//		System.out.printf("%s(%s)��, �ܾ� : %d��\n", ownername, accountNo, balance);
//	}
	
	@Override
	public String toString() {
		return String.format("%s(%s)��, �ܾ� : %d��\n", ownername, accountNo, balance);
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