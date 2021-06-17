package com.lec.condition;

public class Ex03_switch_2 /* 컴퓨터가 발생한 점수(난수)의 학점 출력*/{
	public static void main(String[] args) {
		int score = (int)(Math.random() * 101); // math.random * 101 : (0이상 1미만의 난수만 발생) * 101
		
		switch (score / 10) {
			case 10 :
			case 9 :
				System.out.println("A학점");
				break;
			case 8 :
				System.out.println("B학점");
				break;
			case 7 :
				System.out.println("C학점");
				break;
			case 6 :
				System.out.println("D학점");
				break;
			default :
				System.out.println("F학점");
				break;
		} // switch
	} // main
} // class
