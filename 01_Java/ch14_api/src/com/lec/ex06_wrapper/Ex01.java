package com.lec.ex06_wrapper;

public class Ex01 {
	public static void main(String[] args) {
		int i = 10;
		int j = 10;
		Integer iobj = new Integer(10);
		Integer jobj = new Integer(10);
		int sum = i+j;
		
		sum = iobj.intValue() + jobj.intValue();
		sum = iobj + jobj;
		
		System.out.println(sum);
		System.out.println(iobj.equals(jobj)? "����" : "�ٸ���");
		System.out.println(iobj == jobj? "�ּҰ� ����" : "�ּҰ� �ٸ���");
	} // main
} // class