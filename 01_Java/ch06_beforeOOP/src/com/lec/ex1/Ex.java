package com.lec.ex1;
import com.lec.ex.Arithmetic;

public class Ex {
	public static void main(String[] args) {
		Arithmetic ar = new Arithmetic();
		int tot = ar.sum(10, 100);
		System.out.println(ar.evenOdd(tot));
		
		// tot1 = ar.sum(10); default ������������ ��� ���� ��Ű�������� ��� ����
	}
}
