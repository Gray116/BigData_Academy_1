package com.lec.ex3_exceptionEx;

public class Ex01 {
	public static void main(String[] args) {
		String strNo = "10";
		int no = 0;
		
		try {
			no = Integer.parseInt(strNo.trim()); // string �Ű������� ���ڷ� �ٲ���
		} 
		catch (NumberFormatException e) {
			System.out.println("�Է����� �ʴ� ���� 0���� �ʱ�ȭ");
		}
		System.out.println(no + 1);
	}
}