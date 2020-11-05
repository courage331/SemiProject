package com.lec.beans;

public class PetDTO {
	private int pet_num;
	private String pet_name;
	private int pet_age;
	private int pet_weight;
	private int pet_reserve;
	private int pet_image;
	private int cus_num;
	
	
	public PetDTO() {
		super();
	}
	
	
	public PetDTO(int pet_num, String pet_name, int pet_age, int pet_weight, int pet_reserve, int pet_image, int cus_num) {
		super();
		this.pet_num = pet_num;
		this.pet_name = pet_name;
		this.pet_age = pet_age;
		this.pet_weight = pet_weight;
		this.pet_reserve = pet_reserve;
		this.pet_image = pet_image;
		this.cus_num = cus_num;
	}

	public int getPet_reserve() {
		return pet_reserve;
	}

	public int getPet_image() {
		return pet_image;
	}

	public void setPet_image(int pet_image) {
		this.pet_image = pet_image;
	}

	public void setPet_reserve(int pet_reserve) {
		this.pet_reserve = pet_reserve;
	}

	public int getPet_num() {
		return pet_num;
	}
	public void setPet_num(int pet_num) {
		this.pet_num = pet_num;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public int getPet_age() {
		return pet_age;
	}
	public void setPet_age(int pet_age) {
		this.pet_age = pet_age;
	}
	public int getPet_weight() {
		return pet_weight;
	}
	public void setPet_weight(int pet_weight) {
		this.pet_weight = pet_weight;
	}
	public int getCus_num() {
		return cus_num;
	}
	public void setCus_num(int cus_num) {
		this.cus_num = cus_num;
	}
	@Override
	public String toString() {
		return "PetDTO [pet_num=" + pet_num + ", pet_name=" + pet_name + ", pet_age=" + pet_age + ", pet_weight="
				+ pet_weight + ", cus_num=" + cus_num + "]";
	}
	
	
}
