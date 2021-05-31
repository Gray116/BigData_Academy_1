package com.lec.ex11_account;

public class CreditLineAccount extends CheckingAccount {
	private int creditLine;
	
	public CreditLineAccount() {
		System.out.println("매개변수(전달받는 값)가 없는 생성자 함수");
	}
	
	public CreditLineAccount(String accountNo, String ownerName, String cardNo, int creditLine) {
		super(accountNo, ownerName, cardNo);
		this.creditLine = creditLine;
	}
	
	public CreditLineAccount(String accountNo, String ownerName, int balance, String cardNo, int creditLine) {
		super(accountNo, ownerName, balance, cardNo);
		this.creditLine = creditLine;
	}
	
	@Override
	public void pay(String cardNo, int amount) {
		if(getCardNo().equals(cardNo)) {
			if(creditLine >= amount) {
				creditLine -= amount;
				System.out.printf("%s님의 현재 한도액 : %d\n", getOwnername(), creditLine);
			}
			else {
				System.out.println("한도 초과");
			}
		}
		else {
			System.out.println("카드번호 불일치");
		}
	}

	public int getCreditLine() {
		return creditLine;
	}

	public void setCreditLine(int creditLine) {
		this.creditLine = creditLine;
	}
}