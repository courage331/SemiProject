package com.lec.beans;

public class ProductDTO {
	private int pro_num;
	private String pro_kind;
	private int pro_price;
	private int pro_cnt;
	private String pro_name;
	private String pro_content;
	
	public ProductDTO() {
		super();
		System.out.println("ProductDTO() 객체 생성");
	}
	
	
	public ProductDTO(int pro_num, String pro_kind, int pro_price, int pro_cnt, String pro_name, String pro_content) {
		super();
		this.pro_num = pro_num;
		this.pro_kind = pro_kind;
		this.pro_price = pro_price;
		this.pro_cnt = pro_cnt;
		this.pro_name = pro_name;
		this.pro_content = pro_content;
	}




	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public String getPro_kind() {
		return pro_kind;
	}
	public void setPro_kind(String pro_kind) {
		this.pro_kind = pro_kind;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public int getPro_cnt() {
		return pro_cnt;
	}
	public void setPro_cnt(int pro_cnt) {
		this.pro_cnt = pro_cnt;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	
	public String getPro_content() {
		return pro_content;
	}


	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
	}


	@Override
	public String toString() {
		return "ProductDTO [pro_num=" + pro_num + ", pro_kind=" + pro_kind + ", pro_price=" + pro_price + ", pro_cnt="
				+ pro_cnt + ", pro_name=" + pro_name + ",pro_content=" + pro_content + " + ]";
	}

	
}
