package kr.co.book.member.dto;

public class MemberDTO {

	private int member_idx;
	private String member_email;
	private String member_pw;
	private String member_nickname;	
	private String location;
	private int code_idx;
	private String member_state;
	private boolean member_grade;
	private int level;
	private int reg_member_idx;
	private String reg_screen;	
	private String mod_member_idx;
	private String mode_screen;
	
	
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getCode_idx() {
		return code_idx;
	}
	public void setCode_idx(int code_idx) {
		this.code_idx = code_idx;
	}
	public String getMember_state() {
		return member_state;
	}
	public void setMember_state(String member_state) {
		this.member_state = member_state;
	}
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getReg_member_idx() {
		return reg_member_idx;
	}
	public void setReg_member_idx(int reg_member_idx) {
		this.reg_member_idx = reg_member_idx;
	}
	public String getReg_screen() {
		return reg_screen;
	}
	public void setReg_screen(String reg_screen) {
		this.reg_screen = reg_screen;
	}
	public String getMod_member_idx() {
		return mod_member_idx;
	}
	public void setMod_member_idx(String mod_member_idx) {
		this.mod_member_idx = mod_member_idx;
	}
	public String getMode_screen() {
		return mode_screen;
	}
	public void setMode_screen(String mode_screen) {
		this.mode_screen = mode_screen;
	}
	public boolean isMember_grade() {
		return member_grade;
	}
	public void setMember_grade(boolean member_grade) {
		this.member_grade = member_grade;
	}
	
	
	
	
}
