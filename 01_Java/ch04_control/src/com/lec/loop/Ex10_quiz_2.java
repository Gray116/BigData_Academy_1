package com.lec.loop;

public class Ex10_quiz_2 /* �ֻ����� ������ �μ��� ���� 6�̵Ǵ� ��츦 ��� */{
	public static void main(String[] args) {
		
		for(int i = 1; i < 7; i++) {
			for(int j = 1; j<7; j++) {
				if(i+j == 6) {
					System.out.printf("�μ��� ���� 6�̵Ǵ� ����� ���� %d + %d\n", i, j);
				}
			} // j-for
		} // i-for
	} // main
} // class