package com.lec.ex;

public class Ex01 { // 1~10 ������ �� ���ϰ�, ¦/Ȧ�� ���� ���
	public static void main(String[] args) {
		int tot = 0;
		
		for(int i=1; i<11; i++) {
			tot += i;
		}
		
		if(tot%2 == 0) {
			System.out.printf("������ ���� %d, ¦���Դϴ�.", tot);
		}
		else {
			System.out.printf("������ ���� %d, Ȧ���Դϴ�.", tot);
		} // if-else
	} // main
} // class