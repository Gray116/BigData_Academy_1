package com.lec.loop;

public class Ex03_for {
	public static void main(String[] args) {
		for(int j=1; j<6; j++) {
			for (int i=1; i<j+1; i++) {
				System.out.print('*');
			} // for-i
			System.out.println();
		} // for-j
	} // main
} // class