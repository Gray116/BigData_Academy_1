package com.lec.ex;

public class Ex01 {
	public static void main(String[] args) {
		int[] iArr = {10, 20, 30, 40, 50}; // 1. �迭 ���� ����� �ʱ�ȭ
		iArr[0] = 96; // �迭�� index�� ����
		
		for(int idx = 0; idx<iArr.length; idx++) { /* idx = �ε���, iArr.length = �迭ũ�� */
			System.out.println(iArr[idx]+" ");
		} // for
		
		int[] iArr2 = new int[5]; // �迭 ���� ����� �迭�޸� ����Ȯ�� (�迭 ��ü ����)
		iArr2[0] = 99;
		
		for(int idx = 0; idx<iArr2.length; idx++) {
			System.out.println("iArr2 �迭��" + idx + "��°�� : " + iArr2[idx]);
		}
		
		int[] iArr3 = new int[3]; // 0~5�������
		iArr3[0] = 98;
		
		for(int temp : iArr3) { // Ȯ�� for���� �̿��� �迭 �� ���� �Ұ�
			System.out.println(temp);
		}
		
//		for(int idx = 0; idx<iArr3.length; idx++) {
//			System.out.println("iArr3 �迭��" + idx + "��°�� : " + iArr3[idx]);
//		}
		
	} // main
} // class