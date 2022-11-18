package kr.co.tayo.dto;

public class HashDTO {
	private String searchname;
	private String searchvalue;
	
	public String getSearchname() {
		return searchname;
	}
	public void setSearchname(String searchname) {
		this.searchname = searchname;
	}
	public String getSearchvalue() {
		return searchvalue;
	}
	public void setSearchvalue(String searchvalue) {
		this.searchvalue = searchvalue;
	}
	private int ha_num;
	public int getHa_num() {
		return ha_num;
	}
	public void setHa_num(int ha_num) {
		this.ha_num = ha_num;
	}
	private String ca_name;
	public String getCa_name() {
		return ca_name;
	}
	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}
	private int ca_num;
	private String ha_name;
	private String ha_value;
	public int getCa_num() {
		return ca_num;
	}
	public void setCa_num(int ca_num) {
		this.ca_num = ca_num;
	}
	public String getHa_name() {
		return ha_name;
	}
	public void setHa_name(String ha_name) {
		this.ha_name = ha_name;
	}
	public String getHa_value() {
		return ha_value;
	}
	public void setHa_value(String ha_value) {
		this.ha_value = ha_value;
	}
	
	private int page;

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

}
