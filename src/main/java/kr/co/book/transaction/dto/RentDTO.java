package kr.co.book.transaction.dto;

import org.apache.ibatis.type.Alias;

@Alias("rent")
public class RentDTO {

	// Library	
	private String library_idx;
	private String member_idx;
	private String library_isbn;
	private String library_title;
	private String library_cover;
	private String library_author;
	private String library_info;
	
	
	public String getLibrary_idx() {
		return library_idx;
	}
	public void setLibrary_idx(String library_idx) {
		this.library_idx = library_idx;
	}
	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
	public String getLibrary_isbn() {
		return library_isbn;
	}
	public void setLibrary_isbn(String library_isbn) {
		this.library_isbn = library_isbn;
	}
	public String getLibrary_title() {
		return library_title;
	}
	public void setLibrary_title(String library_title) {
		this.library_title = library_title;
	}
	public String getLibrary_cover() {
		return library_cover;
	}
	public void setLibrary_cover(String library_cover) {
		this.library_cover = library_cover;
	}
	public String getLibrary_author() {
		return library_author;
	}
	public void setLibrary_author(String library_author) {
		this.library_author = library_author;
	}
	public String getLibrary_info() {
		return library_info;
	}
	public void setLibrary_info(String library_info) {
		this.library_info = library_info;
	}
	
	
	
	
	
}
