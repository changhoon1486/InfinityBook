package kr.co.book.transaction.dto;

import java.sql.Date;

public class TransactionListDTO {
	
	private long library_isbn;
	private int member_idx;
	private int code_idx;
	private int code_code;
	private String member_nickname;
	private String code_codename;
	private int library_idx;
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
	private String review_content;
	private String review_date;
	
	
	
	
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public long getLibrary_isbn() {
		return library_isbn;
	}
	public void setLibrary_isbn(long library_isbn) {
		this.library_isbn = library_isbn;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getCode_idx() {
		return code_idx;
	}
	public void setCode_idx(int code_idx) {
		this.code_idx = code_idx;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getCode_codename() {
		return code_codename;
	}
	public void setCode_codename(String code_codename) {
		this.code_codename = code_codename;
	}
	public int getLibrary_idx() {
		return library_idx;
	}
	public void setLibrary_idx(int library_idx) {
		this.library_idx = library_idx;
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
	public int getCode_code() {
		return code_code;
	}
	public void setCode_code(int code_code) {
		this.code_code = code_code;
	}
	
	
}
 