package com.lec.ex;

public class Arithmetic {
	public int sum(int from, int to) { // �Ű����� 2���� �޼ҵ�
		int result = 0; // �����ؼ� return �� ����
		
		for(int i=from; i<=to; i++) {
			result += i;
		}
		return result;
	}
	public int sum(int to) { // �Ű����� 1���� �޼ҵ�
		int result = 0;
		
		for(int i=1; i<to; i++) {
			result += i;
		}
		return result;
	}
	public String evenOdd(int value) { // ���� value�� �޴� evenOdd �޼ҵ�
		return value%2 == 0? "¦��" : "Ȧ��";
	}
	public int abs(int value) { // ���밪�� ���ϴ� �޼ҵ�
		int result = value>0? value : -(value);
		return result;
	}
}
