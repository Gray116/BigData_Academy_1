package com.lec.loop;

public class Ex06_continue {
	public static void main(String[] args) {
		for (int i=1; i<=5; i++) {
			if (i == 3) {
				continue; // i가 3일때만 실행안됨, i-for부분으로 돌아감
			} // if
			System.out.println("i = " + i);
		} // for
	} // main
} // class