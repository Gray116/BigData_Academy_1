package com.lec.loop;

import java.util.Scanner;

public class Ex10_quiz_3 /* 가위바위보 게임 */{
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int me, com;
		
		do {
			com = (int)(Math.random() * 2) + 1;
			
			System.out.print("가위(1),바위(2),보(3) 중 하나를 고르세요 : ");
			me = sc.nextInt();
			
			if(me == com) {
				System.out.printf("같은 것을 내셨습니다. 나 : %d vs 컴퓨터 : %d\n\n", me, com);
			}
			else if((me == 1 && com == 3) || (me == 2 && com == 1) || (me == 3 && com == 2)) {
				System.out.printf("이기셨습니다. 나 : %d vs 컴퓨터 : %d\n\n", me, com);
				break;
			}
			else {
				System.out.printf("지셨습니다. 나 : %d vs 컴퓨터 : %d\n\n", me, com);
			}
		} while(true); // while
		
		sc.close();
	} // main
} // class