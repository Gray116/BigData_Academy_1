package com.lec.ex0_janmuri;

public class Jumsu {
	/* 데이터 */
	private int no;
	public static int count = 0;
	
	private String name;
	private int kuk;
	private int eng;
	private int math;
	private int hap;
	private double aver;
	
	/* 생성자 함수 */
	public Jumsu() {
	}

	public Jumsu(String name, int kuk, int eng, int math) {
		this.name = name;
		this.kuk = kuk;
		this.eng = eng;
		this.math = math;
		
		no = ++count;
		
		hap = kuk + eng + math;
		aver = (hap / 3.0);
	}

	public void infoPrint() {
		System.out.printf("%d\t%s\t%d\t%d\t%d\t%d\t%.1f\n",no, name, kuk, eng, math, hap, aver);
	}
	
	/* getter, setter */
	public int getKuk() {
		return kuk;
	}

	public void setKuk(int kuk) {
		this.kuk = kuk;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

	public int getHap() {
		return hap;
	}

	public void setHap(int hap) {
		this.hap = hap;
	}

	public double getAver() {
		return aver;
	}

	public void setAver(double aver) {
		this.aver = aver;
	}
}
