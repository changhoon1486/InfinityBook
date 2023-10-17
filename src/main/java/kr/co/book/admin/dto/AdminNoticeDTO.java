package kr.co.book.admin.dto;

import org.apache.ibatis.type.Alias;

@Alias("adminnotice")
public class AdminNoticeDTO {
	
	//Notice
	private String notice_idx;
	private String notice_title;
	private String notice_content;
	private String notice_date;
	private String notice_hit;
	
	//Member
	private String member_nickname;

	public String getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(String notice_idx) {
		this.notice_idx = notice_idx;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_hit() {
		return notice_hit;
	}

	public void setNotice_hit(String notice_hit) {
		this.notice_hit = notice_hit;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	
	

}
