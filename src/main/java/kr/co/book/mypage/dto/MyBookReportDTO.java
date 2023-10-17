package kr.co.book.mypage.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("myBookReport")
public class MyBookReportDTO {
	
	private int book_report_idx;
	private String book_report_title;
	private String title;
	private String cover;
	private String author;
	private int book_report_blind;
	private int member_idx;
	private long isbn;
	private String content;
	private Date book_report_date;
	private int book_report_hit;
	private int book_report_open;
	private String publisher;
	private String description;
	private Date pubdate;
	private int totalpage;
	private int like_state;
	private int likes;
	  
	
	
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getBook_report_idx() {
		return book_report_idx;
	}
	public void setBook_report_idx(int book_report_idx) {
		this.book_report_idx = book_report_idx;
	}
	public String getBook_report_title() {
		return book_report_title;
	}
	public void setBook_report_title(String book_report_title) {
		this.book_report_title = book_report_title;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getBook_report_blind() {
		return book_report_blind;
	}
	public void setBook_report_blind(int book_report_blind) {
		this.book_report_blind = book_report_blind;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public long getIsbn() {
		return isbn;
	}
	public void setIsbn(long isbn) {
		this.isbn = isbn;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getBook_report_date() {
		return book_report_date;
	}
	public void setBook_report_date(Date book_report_date) {
		this.book_report_date = book_report_date;
	}
	public int getBook_report_hit() {
		return book_report_hit;
	}
	public void setBook_report_hit(int book_report_hit) {
		this.book_report_hit = book_report_hit;
	}
	public int getBook_report_open() {
		return book_report_open;
	}
	public void setBook_report_open(int book_report_open) {
		this.book_report_open = book_report_open;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getPubdate() {
		return pubdate;
	}
	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public int getLike_state() {
		return like_state;
	}
	public void setLike_state(int like_state) {
		this.like_state = like_state;
	}
	
	
}
