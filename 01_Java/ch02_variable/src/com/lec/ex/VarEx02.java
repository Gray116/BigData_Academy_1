package com.lec.ex;

public class VarEx02 {
	public static void main(String[] args) {
		int i = 10 ; // 4byte짜리 i 주머니에 10을 넣는다.
		byte j = 20 ; // 1byte짜리 j 주머니에 20을 할당
		double d = 1 ; // 8byte짜리 d 주머니에 0.1을 할당한다.
		//char c = '씨' ; // 2byte 문자 c주머니에 '씨(에 해당하는 코드 값)'를 할당
		boolean ok = true ;
		//int l = 2200000000 ; 
		System.out.println("i\t j\t d") ; //\t탭 println 개행문자포함
		System.out.println(i + "\t" + j + "\t" + d) ;
		System.out.print("변수 c의 값과 코드\n");	// print 개행문자 포함안됨
		//System.out.printf("c=%d, c의 코드값=%d", c, (int)c) ;
		//System.out.printf("ok=%b\n",  ok);
		//System.out.printf("l=%d\n", 1) ;
		//System.out.printf("d=%5.2f", d) ;
		// %d(정수) %f(실수) %b(불린) %x(16진수) %c(문자) %s(문자열)
	}

}
