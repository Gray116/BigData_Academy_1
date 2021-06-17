package com.lec.ex03_math;

import java.util.Random;

// �迭�� �ζ� ��ȣ 6�� �����ϱ�
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
			} // j-for : �ߺ��Ǽ� �ٽ� �̾ƾ��ϴ� ���
			
			if(ok) {
				lotto[i] = temp;
			}
		} // i-for : �߻��� ������ ���� ���� �������� �ߺ�Ȯ��
		
		for(int l : lotto) {
			System.out.print(l + "\t");
		}
	} // main
} // class