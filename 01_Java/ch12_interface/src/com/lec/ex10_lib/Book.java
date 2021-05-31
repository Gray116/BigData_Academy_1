package com.lec.ex10_lib;

public class Book implements ILendable {
	private String bookNo; // å�� �з���ȣ
	private String bookTitle; // å�� ����
	private String writer; // å�� ����	
	private String borrower; // ������
	private String checkOutDate; // å�� ���� ��¥
	private byte state; // ���� ����(1 = ������, 0 = ���� ����)
	
	public Book(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}

	@Override
	public void checkOut(String borrower, String checkOutDate) {
		if(state != STATE_NORMAL) {
			System.out.println("���� ���� �����Դϴ�.");
			return;
		}
		/* ���� ó�� ���� */
		this.borrower = borrower;
		this.checkOutDate = checkOutDate;
		state = STATE_BORROWED;
		
		System.out.println("\"" + bookTitle + "\" ������ ����Ǿ����ϴ�.");
	}
	
	/* book.checkIn() */
	@Override
	public void checkIn() {
		if(state != STATE_BORROWED) {
			System.out.println("�������� ������ �ƴմϴ�.");
			return;
		}
		/* �ݳ� ó�� ���� */
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL;
		
		System.out.println("\"" + bookTitle + "\" ������ �ݳ��Ǿ����ϴ�.");
	}
	
	@Override
	public String toString() {
		String result = String.format("%s, %s�� ", bookTitle, writer);
		result += (state == STATE_NORMAL? "���� ����" : "���� ��");
		return result;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public byte getState() {
		return 0;
	}
}