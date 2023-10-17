package kr.co.book.club.dto;

import org.apache.ibatis.type.Alias;

@Alias("club")
public class ClubDTO {


    private String club_idx;
	private String member_idx;
    private String isbn;
    private String title;
    private String cover;
    private String club_name;
    private String club_content;
    private String club_date;
    private String club_meetdate;
    private String code_idx;
    
    private String club_onoff;
    private String meet_num;
    private String club_num;
    private String club_blind;
    private String club_state;
    
    private String club_appdate;
    private String club_appstate;
    
    
    private String code_codename;
    private String code_code;
    private String code_upcode;
    
    
    
    private String member_email;
    private String member_pw;
    private String member_nickname;
    private String member_state;
    private String member_grade;
    private String member_level;
    
    private String parent_idx;
    private String reply_idx;
    private String idx;
    private String reply_content;
    private String reg_date;
    
    
    public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	private String reply_blind;
    
	public String getParent_idx() {
		return parent_idx;
	}
	public void setParent_idx(String parent_idx) {
		this.parent_idx = parent_idx;
	}
	public String getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(String reply_idx) {
		this.reply_idx = reply_idx;
	}
	public String getReply_blind() {
		return reply_blind;
	}
	public void setReply_blind(String reply_blind) {
		this.reply_blind = reply_blind;
	}
	public String getClub_idx() {
		return club_idx;
	}
	public void setClub_idx(String club_idx) {
		this.club_idx = club_idx;
	}
	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public String getClub_content() {
		return club_content;
	}
	public void setClub_content(String club_content) {
		this.club_content = club_content;
	}
	public String getClub_date() {
		return club_date;
	}
	public void setClub_date(String club_date) {
		this.club_date = club_date;
	}
	public String getClub_meetdate() {
		return club_meetdate;
	}
	public void setClub_meetdate(String club_meetdate) {
		this.club_meetdate = club_meetdate;
	}
	public String getCode_idx() {
		return code_idx;
	}
	public void setCode_idx(String code_idx) {
		this.code_idx = code_idx;
	}
	public String getClub_onoff() {
		return club_onoff;
	}
	public void setClub_onoff(String club_onoff) {
		this.club_onoff = club_onoff;
	}
	public String getClub_num() {
		return club_num;
	}
	public void setClub_num(String club_num) {
		this.club_num = club_num;
	}
	public String getClub_blind() {
		return club_blind;
	}
	public void setClub_blind(String club_blind) {
		this.club_blind = club_blind;
	}
	public String getClub_state() {
		return club_state;
	}
	public void setClub_state(String club_state) {
		this.club_state = club_state;
	}
	public String getClub_appdate() {
		return club_appdate;
	}
	public void setClub_appdate(String club_appdate) {
		this.club_appdate = club_appdate;
	}
	public String getClub_appstate() {
		return club_appstate;
	}
	public void setClub_appstate(String club_appstate) {
		this.club_appstate = club_appstate;
	}
	public String getCode_codename() {
		return code_codename;
	}
	public void setCode_codename(String code_codename) {
		this.code_codename = code_codename;
	}
	public String getCode_upcode() {
		return code_upcode;
	}
	public void setCode_upcode(String code_upcode) {
		this.code_upcode = code_upcode;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_state() {
		return member_state;
	}
	public void setMember_state(String member_state) {
		this.member_state = member_state;
	}
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}
	public String getMember_level() {
		return member_level;
	}
	public void setMember_level(String member_level) {
		this.member_level = member_level;
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
	public String getMeet_num() {
		return meet_num;
	}
	public void setMeet_num(String meet_num) {
		this.meet_num = meet_num;
	}
	public String getCode_code() {
		return code_code;
	}
	public void setCode_code(String code_code) {
		this.code_code = code_code;
	}
   
        

    
}
