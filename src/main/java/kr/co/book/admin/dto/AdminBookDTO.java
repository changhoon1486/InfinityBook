package kr.co.book.admin.dto;

import org.apache.ibatis.type.Alias;

@Alias("adminBook")

public class AdminBookDTO {
	private int library_idx;
	private int member_idx;
	private String library_title;
	private String library_info;
	private int library_blind;
	public int getLibrary_idx() {
		return library_idx;
	}
	public void setLibrary_idx(int library_idx) {
		this.library_idx = library_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getLibrary_title() {
		return library_title;
	}
	public void setLibrary_title(String library_title) {
		this.library_title = library_title;
	}
	public String getLibrary_info() {
		return library_info;
	}
	public void setLibrary_info(String library_info) {
		this.library_info = library_info;
	}
	public int getLibrary_blind() {
		return library_blind;
	}
	public void setLibrary_blind(int library_blind) {
		this.library_blind = library_blind;
	}
	
	

}
