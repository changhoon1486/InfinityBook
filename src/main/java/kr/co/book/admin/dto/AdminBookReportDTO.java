package kr.co.book.admin.dto;

import org.apache.ibatis.type.Alias;

@Alias("adminBookReport")
public class AdminBookReportDTO {
	private String book_report_idx;
	private String member_idx;
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	private String member_email;
	private String title;
	private String author;
	private String cover;
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	private String isbn;
	private String book_report_title;
	private String book_report_content;
	private String book_report_date;
	private String book_report_hit;
	private String book_report_blind;
	private String book_report_open;
	public String getBook_report_idx() {
		return book_report_idx;
	}
	public void setBook_report_idx(String book_report_idx) {
		this.book_report_idx = book_report_idx;
	}
	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
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
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBook_report_title() {
		return book_report_title;
	}
	public void setBook_report_title(String book_report_title) {
		this.book_report_title = book_report_title;
	}
	public String getBook_report_content() {
		return book_report_content;
	}
	public void setBook_report_content(String book_report_content) {
		this.book_report_content = book_report_content;
	}
	public String getBook_report_date() {
		return book_report_date;
	}
	public void setBook_report_date(String book_report_date) {
		this.book_report_date = book_report_date;
	}
	public String getBook_report_hit() {
		return book_report_hit;
	}
	public void setBook_report_hit(String book_report_hit) {
		this.book_report_hit = book_report_hit;
	}
	public String getBook_report_blind() {
		return book_report_blind;
	}
	public void setBook_report_blind(String book_report_blind) {
		this.book_report_blind = book_report_blind;
	}
	public String getBook_report_open() {
		return book_report_open;
	}
	public void setBook_report_open(String book_report_open) {
		this.book_report_open = book_report_open;
	}
	
	
	
}
