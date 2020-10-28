package com.lec.beans;
// 1028  - 2:26 이호인 ReviewDTO
public class ReviewDTO {
	private int num; // rev_num
	private String subject; // rev_subject 
	private String content; // rev_content
	private int star; // rev_star
	private String regDate; //rev_regdate
	private int c_num; // cus_num
	
	// 기본 생성자
	public ReviewDTO(){
		super();
		System.out.println("WriteDTO() 객체 생성");
	}
	
	
	// 매개변수 받는 생성자 
	public ReviewDTO(int num, String subject, String content, int star, int c_num) {
		super();
		this.num = num;
		this.subject = subject;
		this.content = content;
		this.star = star;
//		this.regDate = regDate;
		this.c_num = c_num;
	}


	public int getNum() {
		System.out.println("getNum() 호출");
		return num;
	}


	public void setNum(int num) {
		System.out.println("setNum(" + num + ") 호출");
		this.num = num;
	}


	public String getSubject() {
		System.out.println("getSubject() 호출");
		return subject;
	}


	public void setSubject(String subject) {
		System.out.println("setSubject(" + subject + ") 호출");
		this.subject = subject;
	}


	public String getContent() {
		System.out.println("getContent() 호출");
		return content;
	}


	public void setContent(String content) {
		System.out.println("setContent(" + content + ") 호출");
		this.content = content;
	}


	public int getStar() {
		System.out.println("getStart() 호출");
		return star;
	}


	public void setStar(int star) {
		System.out.println("setStart(" + star +") 호출");
		this.star = star;
	}


	public String getRegDate() {
		System.out.println("getRegDate() 호출");
		return regDate;
	}


	public void setRegDate(String regDate) {
		System.out.println("setRegDate(" + regDate + ") 호출");
		this.regDate = regDate;
	}


	public int getC_num() {
		System.out.println("getU_num() 호출");
		return c_num;
	}


	public void setC_num(int c_num) {
		System.out.println("setC_num(" + c_num + ") 호출");
		this.c_num = c_num;
	}


	@Override
	public String toString() {
		return "ReviewDTO [num=" + num + ", subject=" + subject + ", content=" + content + ", star=" + star
				+ ", regDate=" + regDate + ", c_num=" + c_num + "]";
	}
	
		
	
}
