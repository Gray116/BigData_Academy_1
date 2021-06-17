package com.lec.exam;

public class StudentDTO {
	private int rank;
	private String sno;
	private String sname;
	private int mno;
	private int score;
	private int sexpel;
	private String mname;
	
	/* 학생 입력 용*/
	public StudentDTO(String sno, String sname, String mname, int score) {
		this.sno = sno;
		this.sname = sname;
		this.mname = mname;
		this.score = score;
	}
	
	/* 학생 조회 용*/
	public StudentDTO(int rank, String sname, String mname, int score) {
		this.rank = rank;
		this.sname = sname;
		this.mname = mname;
		this.score = score;
	}

	public int getRank() {
		return rank;
	}

	public String getSno() {
		return sno;
	}

	public String getSname() {
		return sname;
	}

	public int getMno() {
		return mno;
	}

	public int getScore() {
		return score;
	}

	public int getSexpel() {
		return sexpel;
	}
	
	public String getMname() {
		return mname;
	}

	@Override
	public String toString() {
		if(sno!=null)
			return sno + "\t" + sname + "\t\t" + mname + "\t" + score;
		else
			return rank + "\t" + sname + "\t\t" + mname + "\t" + score;
	}
}