package kr.co.tayo.dto;

public class TripDTO {
	private int tr_num;
	private String tr_name;
	private String tr_addr;

	public int getFi_num() {
		return fi_num;
	}
	public void setFi_num(int fi_num) {
		this.fi_num = fi_num;
	}
	public String getOriFileName() {
		return oriFileName;
	}
	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	private int fi_num;
	private String oriFileName;
	private String newFileName;
	private String path;
	public int getTr_num() {
		return tr_num;
	}
	public void setTr_num(int tr_num) {
		this.tr_num = tr_num;
	}
	public String getTr_name() {
		return tr_name;
	}
	public void setTr_name(String tr_name) {
		this.tr_name = tr_name;
	}
	public String getTr_addr() {
		return tr_addr;
	}
	public void setTr_addr(String tr_addr) {
		this.tr_addr = tr_addr;
	}
}
