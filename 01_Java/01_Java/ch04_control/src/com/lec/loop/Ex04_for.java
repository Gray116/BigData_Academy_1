package com.lec.loop;

public class Ex04_for {
	public static void main(String[] args) {
		for (int i=15; i<51; i++) {
				System.out.print(i + " ");
				
				if (i%5 == 4) /* �������� 4�� �ٹٲ� */{
					System.out.println();
				} // if
		} // for-i
	} // main
} // class