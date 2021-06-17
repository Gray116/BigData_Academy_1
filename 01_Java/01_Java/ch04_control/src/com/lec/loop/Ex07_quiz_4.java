package com.lec.loop;

public class Ex07_quiz_4 {
	public static void main(String[] args) {
		for(int j=1; j<10; j++) {
			for(int i=2; i<10; i++) {
				System.out.printf("%d*%d=%d\t", i, j, i * j);
				
				if (i == 9) {
					System.out.println();
				}
			} // i-for
		} // j-for
	} // main
} // class