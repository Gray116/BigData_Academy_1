package com.lec.ex11;

public interface ILendable { // �۾����赵
	public byte STATE_BORROWED = 1; // ���� ���� ��
	public byte STATE_UNBORROWED = 0;
	public void checkOut(String borrower, String checkOutData); // ���� ����
	public void checkIn(); // �ݳ�
	public String toString();
}