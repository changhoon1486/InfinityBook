package kr.co.book.admin.dto;

import org.apache.ibatis.type.Alias;

@Alias("inquiry")
public class AdminInquiryDTO {

	//Inquiry
	private String inquiry_idx;
	private String inquiry_upidx;
	private String code_idx;
	private String inquiry_title;
	private String inquiry_content;
	private String inquiry_regdate;
	private String inquiry_state;
	private String member_i;
	
	
	//Member
	private String member_nickname;
	private String member_idx;
	
	
	public String getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}

	public String getMember_i() {
		return member_i;
	}

	public void setMember_i(String member_i) {
		this.member_i = member_i;
	}

	public String getInquiry_upidx() {
		return inquiry_upidx;
	}

	public void setInquiry_upidx(String inquiry_upidx) {
		this.inquiry_upidx = inquiry_upidx;
	}

	public String getInquiry_idx() {
		return inquiry_idx;
	}

	public void setInquiry_idx(String inquiry_idx) {
		this.inquiry_idx = inquiry_idx;
	}

	public String getCode_idx() {
		return code_idx;
	}

	public void setCode_idx(String code_idx) {
		this.code_idx = code_idx;
	}

	public String getInquiry_title() {
		return inquiry_title;
	}

	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}

	public String getInquiry_content() {
		return inquiry_content;
	}

	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}

	public String getInquiry_regdate() {
		return inquiry_regdate;
	}

	public void setInquiry_regdate(String inquiry_regdate) {
		this.inquiry_regdate = inquiry_regdate;
	}

	public String getInquiry_state() {
		return inquiry_state;
	}

	public void setInquiry_state(String inquiry_state) {
		this.inquiry_state = inquiry_state;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	
	
	
	
}
