package com.lec.loop;

public class Ex06_continue {
	public static void main(String[] args) {
		for (int i=1; i<=5; i++) {
			if (i == 3) {
				continue; // i�� 3�϶��� ����ȵ�, i-for�κ����� ���ư�
			} // if
			System.out.println("i = " + i);
		} // for
	} // main
} // class