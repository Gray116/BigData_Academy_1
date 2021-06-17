/* rank, name, jname, kor, eng, mat, sum */

package com.lec.ex1Person;

public class PersonDTO {
	private int rank;
	private String name;
	private String jname;
	private int kor;
	private int eng;
	private int mat;
	private int sum;
	
	/* INSERT¿ë */
	public PersonDTO(String jname, String name, int kor, int eng, int mat) {
		this.name = name;
		this.jname = jname;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}
	
	/* SELECT¿ë */
	public PersonDTO(int rank, String jname, String name, int kor, int eng, int mat, int sum) {
		this.rank = rank;
		this.name = name;
		this.jname = jname;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		this.sum = sum;
	}

	public int getRank() {
		return rank;
	}

	public String getName() {
		return name;
	}

	public String getJname() {
		return jname;
	}

	public int getKor() {
		return kor;
	}

	public int getEng() {
		return eng;
	}

	public int getMat() {
		return mat;
	}

	public int getSum() {
		return sum;
	}
	
	@Override
	public String toString() {
		return rank + "µî\t" + jname + "\t" + name + "\t" + kor + "\t" + 
				eng + "\t" + mat + "\t" + sum;
	}
}