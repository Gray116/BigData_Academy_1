package com.lec.ex0_janmuri;

class Person {
	/* 데이터 변수 설정 */
	private String name;
	private int age;
	private char gender;
	
	/* 생성자 함수 생성*/
	public Person() {
	}

	public Person(String name, int age, char gender) {
		this.name = name;
		this.age = age;
		this.gender = gender;
	}
	
	public String infoString() {
		String result = "이름 : " + name +", 나이 : "+age+", gender : "+gender;
		return result;
	}
	
	public void infoPrint() {
		System.out.printf("이름 : %s, 나이 : %d, 성별 : %c\n", name, age, gender);
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}
	
}

public class PersonTestMain {
	public static void main(String[] args) {
		Person[] person = {new Person("홍길동", 20, 'm'), 
												 new Person("홍길순", 22, 'f'),
												 new Person()
		};
		
		person[2].setName("홍길정");
		person[2].setAge(25);
		person[2].setGender('m');
		
		for(int idx = 0; idx<person.length; idx++) { // 일반 for문
			person[idx].infoPrint();
//			System.out.println(person[idx].infoString());
		}
		
		for(Person p : person) {
			p.infoPrint();
			System.out.println(p.infoString());
		}
	}
}














