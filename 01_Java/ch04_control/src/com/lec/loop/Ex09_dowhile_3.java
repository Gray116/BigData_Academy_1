package com.lec.loop;

import java.util.Scanner;

public class Ex09_dowhile_3 {
	public static void main(String[] args) {
		/* System.out.println((int)(Math.random() * 45)); 0~44까지의 난수 발생 */
		Scanner sc = new Scanner(System.in);
		
		int su, lotto;
		
		lotto = (int)(Math.random() * 45) + 1;
		
		do {
			System.out.print("1부터 45사이의 숫자를 맞춰보세요 : ");
			su = sc.nextInt();
			
			if(su == lotto) {
				break;
			}
			else if(su < lotto) {
				System.out.print("입력하신 수보다 큰 수에요.\n");
			}
			else {
				System.out.print("입력하신 수보다 작은 수에요.\n");
			}
		} while(true);
		
		System.out.println("정답입니다.\n");
		sc.close();
	}
}