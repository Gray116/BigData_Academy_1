package com.lec.loop;

public class Ex10_quiz_1 {
	public static void main(String[] args) {
		int i = 0;
		int tot = 0;
		
		do {
			if((i%2 != 0) && (i%3 != 0)) {
				tot += i;
			} // if
			i++;
		} while(i < 21); // while
		
		System.out.printf("1���� 20������ ���� �߿��� 2�� 3�� ����� �ƴ� ���� ���� %d�Դϴ�.", tot);
	} // main
} // class