package com.lec.ex11;

public class BookLib extends BookInfo implements ILendable {
	private byte state;
	private String borrower;
	private String checkOutDate;

	public BookLib(String bookNo, String bookTitle, String writer) {
		super(bookNo, bookTitle, writer);
	}

	@Override
	public void checkOut(String borrower, String checkOutData) {
		if(state != STATE_UNBORROWED) {
			System.out.println("���� ���� ���� �����Դϴ�.");
			return;
		}
		/* ���� ó�� ���� */
		this.borrower = borrower;
		this.checkOutDate = checkOutData;
		state = STATE_BORROWED;
		
		System.out.println("\"" + getBookTitle() + "\" ������ ����Ǿ����ϴ�.\n");
	}

	@Override
	public void checkIn() {
		if(state != STATE_BORROWED) {
			System.out.println("���� ���� ���� ������ �ƴմϴ�.");
			return;
		}
		/* �ݳ� ó�� ���� */
		borrower = null;
		checkOutDate = null;
		state = STATE_UNBORROWED;
		
		System.out.println("\"" + getBookTitle() + "\" ������ �ݳ��Ǿ����ϴ�.\n");
	}
	
	@Override
	public String toString() {
		String result = String.format("%s, %s(��) ", getBookTitle(), getWriter());
		result += (state == STATE_UNBORROWED? "���� ����" : "���� ��");
		return result;
	}
	
	public byte getState() {
		return state;
	}
}