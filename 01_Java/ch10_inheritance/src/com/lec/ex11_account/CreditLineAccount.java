package com.lec.ex11_account;

public class CreditLineAccount extends CheckingAccount {
	private int creditLine;
	
	public CreditLineAccount() {
		System.out.println("�Ű�����(���޹޴� ��)�� ���� ������ �Լ�");
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
				System.out.printf("%s���� ���� �ѵ��� : %d\n", getOwnername(), creditLine);
			}
			else {
				System.out.println("�ѵ� �ʰ�");
			}
		}
		else {
			System.out.println("ī���ȣ ����ġ");
		}
	}

	public int getCreditLine() {
		return creditLine;
	}

	public void setCreditLine(int creditLine) {
		this.creditLine = creditLine;
	}
}