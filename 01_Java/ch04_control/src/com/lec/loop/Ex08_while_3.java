package com.lec.loop;

public class Ex08_while_3 /* 1���� 100���� 3�� ��� ��� */{
	public static void main(String[] args) {
		int tot = 0;
		int i = 0;
		
		while(++i < 20) {
			if(i%3 != 0) {
				continue;
			} // if
			tot += i;
		} // while
		
		System.out.printf("1���� 100���� 3�� ����� ���� %d�Դϴ�.\n", tot);
	} // main
} // class