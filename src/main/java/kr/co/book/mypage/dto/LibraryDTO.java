package kr.co.book.mypage.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("library")

public class LibraryDTO {
	/*
	 * library_idx,member_idx,library_isbn,library_title,library_cover,
	 * library_author,
	 * library_price,library_publisher,library_description,library_pubdate,
	 * library_info, library_use,library_sharestate,library_blind,library_reg_date
	 */
	
	private int library_idx;
	private int member_idx;
	private long library_isbn;
	private String  library_title;
	private String  library_cover;
	private String library_author;
	private int library_price;
	private String library_publisher;
	private String library_description;
	private Date library_pubdate;
	private String library_info;
	private String library_use;
	private boolean library_sharestate;
	private boolean library_blind;
	private Date library_reg_date;
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
	public long getLibrary_isbn() {
		return library_isbn;
	}
	public void setLibrary_isbn(long library_isbn) {
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
	public int getLibrary_price() {
		return library_price;
	}
	public void setLibrary_price(int library_price) {
		this.library_price = library_price;
	}
	public String getLibrary_publisher() {
		return library_publisher;
	}
	public void setLibrary_publisher(String library_publisher) {
		this.library_publisher = library_publisher;
	}
	public String getLibrary_description() {
		return library_description;
	}
	public void setLibrary_description(String library_description) {
		this.library_description = library_description;
	}
	public Date getLibrary_pubdate() {
		return library_pubdate;
	}
	public void setLibrary_pubdate(Date library_pubdate) {
		this.library_pubdate = library_pubdate;
	}
	public String getLibrary_info() {
		return library_info;
	}
	public void setLibrary_info(String library_info) {
		this.library_info = library_info;
	}
	public String getLibrary_use() {
		return library_use;
	}
	public void setLibrary_use(String library_use) {
		this.library_use = library_use;
	}
	public boolean isLibrary_sharestate() {
		return library_sharestate;
	}
	public void setLibrary_sharestate(boolean library_sharestate) {
		this.library_sharestate = library_sharestate;
	}
	public boolean isLibrary_blind() {
		return library_blind;
	}
	public void setLibrary_blind(boolean library_blind) {
		this.library_blind = library_blind;
	}
	public Date getLibrary_reg_date() {
		return library_reg_date;
	}
	public void setLibrary_reg_date(Date library_reg_date) {
		this.library_reg_date = library_reg_date;
	}
	
	
	
	
}
