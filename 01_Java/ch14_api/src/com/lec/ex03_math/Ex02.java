package com.lec.ex03_math;
// �ݿø�, �ø�, ����
public class Ex02 {
	public static void main(String[] args) {
		System.out.println("�Ҽ������� �ݿø�, �ø�, ����");
		System.out.println("9.12�� �ø� : " + Math.ceil(9.12)); // ����� �� ��ȯ ����
		System.out.println("9.12�� �ݿø� : " + Math.round(9.12));
		System.out.println("9.12�� ���� : " + Math.floor(9.12));
		System.out.println();
		System.out.println("�Ҽ��� ���ڸ����� �ݿø�, �ø�, ����");
		System.out.println("9.15�� �ø� : " + Math.ceil(9.15 * 10) / 10);
		System.out.println("9.15�� �ݿø� : " + Math.round(9.15 * 10) / 10.0);
		System.out.println("9.15�� ���� : " + Math.floor(9.15 * 10) / 10);
		System.out.println();
		System.out.println("���� �ڸ����� �ݿø�, �ø�, ����");
		System.out.println("85�� �ø�(90) : " + (int)Math.ceil(85/ 10.0) * 10);
		System.out.println("85�� �ݿø�(90) : " + Math.round(85 / 10.0) * 10);
		System.out.println("85�� ���� : " + (int)Math.floor(85 / 10.0) * 10);
	}
}