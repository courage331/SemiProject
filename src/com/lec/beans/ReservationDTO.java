package com.lec.beans;

public class ReservationDTO {

	int res_num;
	String res_startdate;
	String res_lastdate;
	String message;
	int cus_num;
	int pet_num;
	
	public ReservationDTO() {
		super();
		System.out.println("ReservationDTO() 객체 생성");
	}
	
	
	public ReservationDTO(int res_num, String res_startdate, String res_lastdate, String message, int cus_num,
			int pet_num) {
		super();
		this.res_num = res_num;
		this.res_startdate = res_startdate;
		this.res_lastdate = res_lastdate;
		this.message = message;
		this.cus_num = cus_num;
		this.pet_num = pet_num;
	}



	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public String getRes_startdate() {
		return res_startdate;
	}
	public void setRes_startdate(String res_startdate) {
		this.res_startdate = res_startdate;
	}
	public String getRes_lastdate() {
		return res_lastdate;
	}
	public void setRes_lastdate(String res_lastdate) {
		this.res_lastdate = res_lastdate;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getCus_num() {
		return cus_num;
	}
	public void setCus_num(int cus_num) {
		this.cus_num = cus_num;
	}
	public int getPet_num() {
		return pet_num;
	}
	public void setPet_num(int pet_num) {
		this.pet_num = pet_num;
	}
	@Override
	public String toString() {
		return "ReservationDTO [res_num=" + res_num + ", res_startdate=" + res_startdate + ", res_lastdate="
				+ res_lastdate + ", message=" + message + ", cus_num=" + cus_num + ", pet_num=" + pet_num + "]";
	}
	
	
	
}
