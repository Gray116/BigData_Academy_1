package com.lec.ex;

public class Ex01 {
	public static void main(String[] args) {
		int[] iArr = {10, 20, 30, 40, 50}; // 1. 배열 변수 선언과 초기화
		iArr[0] = 96; // 배열은 index로 접근
		
		for(int idx = 0; idx<iArr.length; idx++) { /* idx = 인덱스, iArr.length = 배열크기 */
			System.out.println(iArr[idx]+" ");
		} // for
		
		int[] iArr2 = new int[5]; // 배열 변수 선언과 배열메모리 공간확보 (배열 객체 생성)
		iArr2[0] = 99;
		
		for(int idx = 0; idx<iArr2.length; idx++) {
			System.out.println("iArr2 배열의" + idx + "번째값 : " + iArr2[idx]);
		}
		
		int[] iArr3 = new int[3]; // 0~5번방까지
		iArr3[0] = 98;
		
		for(int temp : iArr3) { // 확장 for문을 이용한 배열 값 변경 불가
			System.out.println(temp);
		}
		
//		for(int idx = 0; idx<iArr3.length; idx++) {
//			System.out.println("iArr3 배열의" + idx + "번째값 : " + iArr3[idx]);
//		}
		
	} // main
} // class