package com.lec.loop;

public class Ex02_for {
	public static void main(String[] args) {
		int tot = 0; // 1~20까지를 누적할 변수
		
		for (int i=1; i<=20; i++) {
			tot += i;
			System.out.print(i );
			
			if (i != 20) {
				System.out.print("+");
			}
		} // for
		
		System.out.println("=" + tot);
	} // main
} // class