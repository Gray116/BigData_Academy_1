package com.lec.ex01_string;

public class Ex02 {
	public static void main(String[] args) {
		String str1 = "abcXabc";
		String str2 = new String("ABCXABC");
		String str3 = "            J     A   B    A";
		
		System.out.println("1. ���ڿ��� - " + str1.concat(str2)); 
		System.out.println("2. n��°���� ������ ��� - " + str1.substring(3)); 
		System.out.println("3. m��°���� (n-1)��°���� ���" + str1.substring(3, 6)); 
		System.out.println("4. ���ڿ��� ���� ��� - " + str1.length()); 
		System.out.println("5. ���ڿ��� ���� �빮�ڷ� - " + str1.toUpperCase()); 
		System.out.println("6. ���ڿ��� ���� �ҹ��ڷ� - " + str1.toLowerCase());
		System.out.println("7. n��° index�� ���ڸ� ��� - " + str1.charAt(2));
		System.out.println("8. ����n�� ó�� ������ index - " + str1.indexOf("b"));
		System.out.println("9. ���� String�� ��� (-1) - " + str1.indexOf("ȫ�浿"));
		System.out.println("10. ����b�� ã�µ� ����° �ε����������� ã�� - " + str1.indexOf("b", 3));
		
		str1 = "abcXabc";
		
		System.out.println("11. �ڿ������� ����b�� ã�� - " + str1.lastIndexOf("b"));
		System.out.println("12. ���� ���ڸ� true, �ƴϸ� false - " + str1.equals(str2));
		System.out.println("13. ��ҹ��ڸ� �������� �ʰ� �� - " + str1.equalsIgnoreCase(str2));
		System.out.println("14. �¿� space(����)�� ���� - " + str3.trim());
		System.out.println("15. ����m�� ����n���� ġȯ  - " + str1.replace("a","��"));
		System.out.println("15. ����m�� ����n���� ���� ġȯ  - " + str1.replaceAll("ab","��"));
	}
}