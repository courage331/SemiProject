package com.lec.beans;

public class ReservationDTO {

	private int res_num;
	private String res_startdate;
	private String res_lastdate;
	private String res_message;
	private String res_sinfo;
	private int res_state;
	private int cus_num;
	private int pet_num;
	
	public ReservationDTO() {
		super();
		System.out.println("ReservationDTO() 객체 생성");
	}
	
	
	public ReservationDTO(int res_num,String res_sinfo, String res_message,int res_state, int cus_num, int pet_num) {
		super();
		this.res_num = res_num;
//		this.res_startdate = res_startdate;
//		this.res_lastdate = res_lastdate;
		this.res_sinfo= res_sinfo;
		this.res_message = res_message;
		this.res_state = res_state;
		this.cus_num = cus_num;
		this.pet_num = pet_num;
	}

	public int getRes_state() {
		return res_state;
	}


	public void setRes_state(int res_state) {
		this.res_state = res_state;
	}


	public String getRes_sinfo() {
		return res_sinfo;
	}


	public void setRes_sinfo(String res_sinfo) {
		this.res_sinfo = res_sinfo;
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

	public String getRes_message() {
		return res_message;
	}

	public void setRes_message(String res_message) {
		this.res_message = res_message;
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
				+ res_lastdate + ", message=" + res_message + ", cus_num=" + cus_num + ", pet_num=" + pet_num + "]";
	}
	
	
	
}
