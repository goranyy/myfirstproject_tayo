package kr.co.tayo.dto;

public class QnaPhotoDTO {
	private int file_num;
	private String oriFileName;
	private String newFileName;
	private int ca_num; 
	private int num;
	
	public int getFile_num() {
		return file_num;
	}
	public void setFile_num(int file_num) {
		this.file_num = file_num;
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
	public int getCa_num() {
		return ca_num;
	}
	public void setCa_num(int ca_num) {
		this.ca_num = ca_num;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	} 
	
	
}
