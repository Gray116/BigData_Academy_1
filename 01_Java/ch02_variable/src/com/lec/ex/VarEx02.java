package com.lec.ex;

public class VarEx02 {
	public static void main(String[] args) {
		int i = 10 ; // 4byte¥�� i �ָӴϿ� 10�� �ִ´�.
		byte j = 20 ; // 1byte¥�� j �ָӴϿ� 20�� �Ҵ�
		double d = 1 ; // 8byte¥�� d �ָӴϿ� 0.1�� �Ҵ��Ѵ�.
		//char c = '��' ; // 2byte ���� c�ָӴϿ� '��(�� �ش��ϴ� �ڵ� ��)'�� �Ҵ�
		boolean ok = true ;
		//int l = 2200000000 ; 
		System.out.println("i\t j\t d") ; //\t�� println ���๮������
		System.out.println(i + "\t" + j + "\t" + d) ;
		System.out.print("���� c�� ���� �ڵ�\n");	// print ���๮�� ���Ծȵ�
		//System.out.printf("c=%d, c�� �ڵ尪=%d", c, (int)c) ;
		//System.out.printf("ok=%b\n",  ok);
		//System.out.printf("l=%d\n", 1) ;
		//System.out.printf("d=%5.2f", d) ;
		// %d(����) %f(�Ǽ�) %b(�Ҹ�) %x(16����) %c(����) %s(���ڿ�)
	}

}
