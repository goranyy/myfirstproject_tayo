package kr.co.tayo.dto;

import java.sql.Date;

public class TogetherReplyDTO {
	
	private int re_num;
	private String re_coment;
	private String mem_id;
	private Date re_date;
	private String se_secret; //비공개 여부. 없다면 null
	
	// re_bo_num, re_num은 안 넣었음.
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
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public String getSe_secret() {
		return se_secret;
	}
	public void setSe_secret(String se_secret) {
		this.se_secret = se_secret;
	}
	
}
