package com.lec.ex01_string;

public class Ex02 {
	public static void main(String[] args) {
		String str1 = "abcXabc";
		String str2 = new String("ABCXABC");
		String str3 = "            J     A   B    A";
		
		System.out.println("1. 문자연결 - " + str1.concat(str2)); 
		System.out.println("2. n번째부터 끝까지 출력 - " + str1.substring(3)); 
		System.out.println("3. m번째부터 (n-1)번째까지 출력" + str1.substring(3, 6)); 
		System.out.println("4. 문자열의 길이 출력 - " + str1.length()); 
		System.out.println("5. 문자열을 전부 대문자로 - " + str1.toUpperCase()); 
		System.out.println("6. 문자열을 전부 소문자로 - " + str1.toLowerCase());
		System.out.println("7. n번째 index의 글자를 출력 - " + str1.charAt(2));
		System.out.println("8. 문자n이 처음 나오는 index - " + str1.indexOf("b"));
		System.out.println("9. 없는 String의 경우 (-1) - " + str1.indexOf("홍길동"));
		System.out.println("10. 문자b를 찾는데 세번째 인덱스에서부터 찾기 - " + str1.indexOf("b", 3));
		
		str1 = "abcXabc";
		
		System.out.println("11. 뒤에서부터 문자b를 찾기 - " + str1.lastIndexOf("b"));
		System.out.println("12. 같은 문자면 true, 아니면 false - " + str1.equals(str2));
		System.out.println("13. 대소문자를 구분하지 않고 비교 - " + str1.equalsIgnoreCase(str2));
		System.out.println("14. 좌우 space(띄어쓰기)를 제거 - " + str3.trim());
		System.out.println("15. 문자m을 문자n으로 치환  - " + str1.replace("a","★"));
		System.out.println("15. 문자m을 문자n으로 전부 치환  - " + str1.replaceAll("ab","별"));
	}
}