package com.lec.ex10_lib;

public interface ILendable {
	public byte STATE_BORROWED = 1; // ���� ���� ��
	public byte STATE_NORMAL = 0;
	public void checkOut(String borrower, String checkOutData); // ���� ����
	public void checkIn(); // �ݳ�
}