package com.lec.loop;

import java.util.Scanner;

public class Ex10_quiz_3 /* ���������� ���� */{
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int me, com;
		
		do {
			com = (int)(Math.random() * 2) + 1;
			
			System.out.print("����(1),����(2),��(3) �� �ϳ��� ������ : ");
			me = sc.nextInt();
			
			if(me == com) {
				System.out.printf("���� ���� ���̽��ϴ�. �� : %d vs ��ǻ�� : %d\n\n", me, com);
			}
			else if((me == 1 && com == 3) || (me == 2 && com == 1) || (me == 3 && com == 2)) {
				System.out.printf("�̱�̽��ϴ�. �� : %d vs ��ǻ�� : %d\n\n", me, com);
				break;
			}
			else {
				System.out.printf("���̽��ϴ�. �� : %d vs ��ǻ�� : %d\n\n", me, com);
			}
		} while(true); // while
		
		sc.close();
	} // main
} // class