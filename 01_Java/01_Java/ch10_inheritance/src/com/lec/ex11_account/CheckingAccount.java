package com.lec.ex11_account;

public class CheckingAccount extends Account {
	private String cardNo;
	
	public CheckingAccount() {
		System.out.println("�Ű�����(���޹޴� ��)�� ���� ������ �Լ�");
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
		if(this.cardNo.equals(cardNo)) {// String�̶� equals ���
			if(getBalance() >= amount) {
				setBalance(getBalance() - amount);
				System.out.printf("%s(%s)��, �����ݾ� : %d��, �ܾ� : %d��\n", getOwnername(), getAccountNo(), amount, getBalance());
			}
			else {
				System.out.println("���� �Ұ�");
			}
		}
		else {
			System.out.println("�ùٸ� ī�� ��ȣ�� �Է����ּ���.");
		}
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
}