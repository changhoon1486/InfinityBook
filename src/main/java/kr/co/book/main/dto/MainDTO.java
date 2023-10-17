package kr.co.book.main.dto;

import org.apache.ibatis.type.Alias;

@Alias("main")
public class MainDTO {
	
	
//l.book_report_idx, SUM(l.like_state), b.title, b.author, m.member_nickname  
	
	private String book_report_idx;
	private String likenum;
	private String title;
	private String author;
	private String member_nickname;
	private String book_report_date;
	private String book_report_title;  
	private String cover;
	
	//count (r.rent_idx) AS cnt, l.library_isbn , l.library_title ,l.library_description ,l.library_idx ,l.library_cover, l.library_author  
	private String cnt;
	private String library_isbn;
	private String library_title;
	private String library_description;
	private String library_idx;
	private String library_cover;
	private String library_author;
	
	
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
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
	public String getLibrary_description() {
		return library_description;
	}
	public void setLibrary_description(String library_description) {
		this.library_description = library_description;
	}
	public String getLibrary_idx() {
		return library_idx;
	}
	public void setLibrary_idx(String library_idx) {
		this.library_idx = library_idx;
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
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getBook_report_title() {
		return book_report_title;
	}
	public void setBook_report_title(String book_report_title) {
		this.book_report_title = book_report_title;
	}
	public String getBook_report_date() {
		return book_report_date;
	}
	public void setBook_report_date(String book_report_date) {
		this.book_report_date = book_report_date;
	}
	public String getBook_report_idx() {
		return book_report_idx;
	}
	public void setBook_report_idx(String book_report_idx) {
		this.book_report_idx = book_report_idx;
	}
	public String getLikenum() {
		return likenum;
	}
	public void setLikenum(String likenum) {
		this.likenum = likenum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	
	
}
