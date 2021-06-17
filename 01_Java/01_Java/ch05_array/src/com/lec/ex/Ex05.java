package com.lec.ex;

import java.util.Scanner;

public class Ex05 { /* Ű �Է� �޾� ��� ���ϱ� */
	public static void main(String[] args) { /* ���� ū �л��� ���� �л� ���ϱ�*/
		
		String[] arrName = {"����", "ö��", "�浿", "����", "����"};
		int[] arrHeight = new int[arrName.length]; // arrName�� ũ�⸸ŭ �Ҵ�
		
		Scanner sc = new Scanner(System.in);
		int tot = 0;
		
		for(int idx=0; idx<arrHeight.length; idx++) {
			System.out.print(arrName[idx] + "�� Ű �Է� : ");
			arrHeight[idx] = sc.nextInt();
			
			tot += arrHeight[idx];
		} // for-idx
		
		System.out.printf("Ű�� �� : %d\n", tot);
		System.out.printf("���Ű : %.1f\n", ((double)tot)/arrHeight.length);
		
		int maxIdx = 0, maxHeight = 0;
		int minIdx = 0, minHeight = 999;
		
		for(int i=0; i<arrHeight.length; i++) {
			if (arrHeight[i] > maxHeight) {
				maxHeight = arrHeight[i];
				maxIdx = i; // ���߿� Ű�� ���� ū �л��� ã�� ���� �ε���
			}
			
			if (arrHeight[i] < minHeight) {
				minHeight = arrHeight[i];
				minIdx = i;
			} // if
		} // for
		System.out.printf("���� Ű�� ���� �л��� %s, Ű : %d\n", arrName[minIdx], minHeight);
		System.out.printf("���� Ű�� ū �л��� %s, Ű : %d\n", arrName[maxIdx], maxHeight);
		
		sc.close();
	} // main
} // class