package com.lec.ex03_math;

import java.util.Random;

// 배열에 로또 번호 6개 저장하기
public class Ex04_lotto {
	public static void main(String[] args) {
		Random random = new Random();
		int[] lotto = new int[6];
		
		for(int i=0; i<6; i++) {
			int temp = (int)(Math.random() * 45) + 1;
			boolean ok = true;
			
			for(int j=0; j<1; j++) {
				i--;
				ok = false;
				break;
			} // j-for : 중복되서 다시 뽑아야하는 경우
			
			if(ok) {
				lotto[i] = temp;
			}
		} // i-for : 발생된 난수가 전에 뽑은 난수인지 중복확인
		
		for(int l : lotto) {
			System.out.print(l + "\t");
		}
	} // main
} // class