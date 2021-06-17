package com.lec.ex11;

public class CdLib extends CdInfo implements ILendable {
	private byte state;
	private String borrower;
	private String checkOutDate;
	
	public CdLib(String cdNo, String cdTitle, String bookNo) {
		super(cdNo, cdTitle, bookNo);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void checkOut(String borrower, String checkOutData) {
		if(state != STATE_UNBORROWED) {
			System.out.println("���� ���� �����Դϴ�.");
			return;
		}
		/* ���� ó�� ���� */
		this.borrower = borrower;
		this.checkOutDate = checkOutData;
		state = STATE_BORROWED;
		
		System.out.println("\"" + getCdTitle() + "\" CD�� ����Ǿ����ϴ�.\n");
	}

	@Override
	public void checkIn() {
		if(state != STATE_BORROWED) {
			System.out.println("�������� ������ �ƴմϴ�.");
			return;
		}
		/* �ݳ� ó�� ���� */
		borrower = null;
		checkOutDate = null;
		state = STATE_UNBORROWED;
		
		System.out.println("\"" + getCdTitle() + "\" CD�� �ݳ��Ǿ����ϴ�.\n");
	}
	
	@Override
	public String toString() {
		String result = String.format("%s, %s ", getCdTitle(), getBookNo());
		result += (state == STATE_UNBORROWED? "���� ����" : "���� ��");
		return result;
	}
	
	public byte getState() {
		return 0;
	}
}