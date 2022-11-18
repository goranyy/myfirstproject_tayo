package kr.co.tayo.dto;

import java.sql.Date;

public class TogetherReRepleDTO {
	
	private int rr_num;
	private String rr_coment;
	private String mem_id;
	private Date rr_date;
	
	public int getRr_num() {
		return rr_num;
	}
	public void setRr_num(int rr_num) {
		this.rr_num = rr_num;
	}
	public String getRr_coment() {
		return rr_coment;
	}
	public void setRr_coment(String rr_coment) {
		this.rr_coment = rr_coment;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getRr_date() {
		return rr_date;
	}
	public void setRr_date(Date rr_date) {
		this.rr_date = rr_date;
	}

}
