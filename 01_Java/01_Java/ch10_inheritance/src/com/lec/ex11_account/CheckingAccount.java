package com.lec.ex11_account;

public class CheckingAccount extends Account {
	private String cardNo;
	
	public CheckingAccount() {
		System.out.println("매개변수(전달받는 값)가 없는 생성자 함수");
	}

	public CheckingAccount(String accountNo, String ownerName, String cardNo) {
		super(accountNo, ownerName);
		this.cardNo = cardNo;
	}
	
	public CheckingAccount(String accountNo, String ownerName, int balance, String cardNo) {
		super(accountNo, ownerName, balance);
		this.cardNo = cardNo;
	}
	
	public void pay(String cardNo, int amount) {
		if(this.cardNo.equals(cardNo)) {// String이라서 equals 사용
			if(getBalance() >= amount) {
				setBalance(getBalance() - amount);
				System.out.printf("%s(%s)님, 결제금액 : %d원, 잔액 : %d원\n", getOwnername(), getAccountNo(), amount, getBalance());
			}
			else {
				System.out.println("지불 불가");
			}
		}
		else {
			System.out.println("올바른 카드 번호를 입력해주세요.");
		}
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
}