package com.lec.beans;

// 1028  - 2:26 이호인 ReviewDTO
public class CmtDTO {

	private int num;
	private String id;
	private String content;
	private String regDate;
	private int r_num;
	private int c_num;

	// 기본 생성자
	public CmtDTO() {
		super();
		System.out.println("CmtDTO() 객체 생성");
	}
	

	public CmtDTO(int num, String id, String content, int r_num, int c_num) {
		super();
		this.num = num;
		this.id = id;
		this.content = content;
//		this.regDate = regDate;
		this.r_num = r_num;
		this.c_num = c_num;
	}



	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	
}
