package com.lec.loop;

public class Ex08_while_2 {
	public static void main(String[] args) {
		int i = 1;
		int tot = 0;
		
		while(i < 11) {
			tot += i;
			System.out.printf("i가 %d일 때 누적합은 %d\n", i, tot);
			i++;
		}
	}
}