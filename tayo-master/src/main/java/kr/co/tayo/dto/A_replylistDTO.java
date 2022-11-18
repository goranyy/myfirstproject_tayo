package kr.co.tayo.dto;

import java.sql.Date;

public class A_replylistDTO {

	 int re_num;	 
	 private String re_coment;
	 private Date re_date;
	 private String mem_id;
	 int bo_num;
	 int num2;
	 private String bo_name;
	 private String se_secret;
	 int num;
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public String getRe_coment() {
		return re_coment;
	}
	public void setRe_coment(String re_coment) {
		this.re_coment = re_coment;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getBo_num() {
		return bo_num;
	}
	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}
	public int getNum2() {
		return num2;
	}
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	public String getBo_name() {
		return bo_name;
	}
	public void setBo_name(String bo_name) {
		this.bo_name = bo_name;
	}
	public String getSe_secret() {
		return se_secret;
	}
	public void setSe_secret(String se_secret) {
		this.se_secret = se_secret;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	 
	 
}
