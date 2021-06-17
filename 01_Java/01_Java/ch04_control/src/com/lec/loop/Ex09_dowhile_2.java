package com.lec.loop;

public class Ex09_dowhile_2 {
	public static void main(String[] args) {
		int cnt = 0;
		
		do {
			System.out.println(cnt + " ");
			
			if(cnt == 5000) {
				break;
			}
			
			cnt++;
		} while(true);
	}
}