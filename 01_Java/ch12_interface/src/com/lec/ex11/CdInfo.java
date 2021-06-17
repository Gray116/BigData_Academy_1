package com.lec.ex11;

public class CdInfo {
	private String cdNo;
	private String cdTitle;
	private String bookNo; // CD가 부록되어 있는 책의 번호
	
	public CdInfo(String cdNo, String cdTitle, String bookNo) {
		this.cdNo = cdNo;
		this.cdTitle = cdTitle;
		this.bookNo = bookNo;
	}

	public String getCdNo() {
		return cdNo;
	}

	public String getCdTitle() {
		return cdTitle;
	}

	public String getBookNo() {
		return bookNo;
	}
}