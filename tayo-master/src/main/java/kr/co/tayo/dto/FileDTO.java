package kr.co.tayo.dto;

public class FileDTO {
	private int fi_num;
	private String oriFileName;
	private String newFileName;
	private String path;
	private int ca_num;
	
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
	public int getCa_num() {
		return ca_num;
	}
	public void setCa_num(int ca_num) {
		this.ca_num = ca_num;
	}
	
	
	
}
