package com.lec.beans;

public class ProductDTO {
	int pro_num;
	String pro_kind;
	int pro_price;
	int pro_cnt;
	String pro_name;
	
	public ProductDTO() {
		super();
		System.out.println("ProductDTO() 객체 생성");
	}
	
	
	public ProductDTO(int pro_num, String pro_kind, int pro_price, int pro_cnt, String pro_name) {
		super();
		this.pro_num = pro_num;
		this.pro_kind = pro_kind;
		this.pro_price = pro_price;
		this.pro_cnt = pro_cnt;
		this.pro_name = pro_name;
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
	@Override
	public String toString() {
		return "ProductDTO [pro_num=" + pro_num + ", pro_kind=" + pro_kind + ", pro_price=" + pro_price + ", pro_cnt="
				+ pro_cnt + ", pro_name=" + pro_name + "]";
	}

	
}
