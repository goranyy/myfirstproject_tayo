package kr.co.tayo.dto;

import java.sql.Date;

public class A_ReviewDTO {
	
	private int num;
	private String title;
	private String content;
	private Date to_date;
	private String mem_id;
	private int bo_num;
	private int cnt;
	private String se_secret;
	public int getNum() {
		return num;
	}
	public String getSe_secret() {
		return se_secret;
	}
	public void setSe_secret(String se_secret) {
		this.se_secret = se_secret;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTo_date() {
		return to_date;
	}
	public void setTo_date(Date to_date) {
		this.to_date = to_date;
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
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getVi_good() {
		return vi_good;
	}
	public void setVi_good(String vi_good) {
		this.vi_good = vi_good;
	}
	private String vi_good;
	


}

