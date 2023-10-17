package kr.co.book.event.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("event")
public class EventDTO {

	private int event_idx;
	private String member_idx;
	private String event_title;
	private String event_content;
	private int  event_cnt;
	private Date event_startdate;
	private Date event_enddate;
	private int event_hit;
	private String reg_member_idx;
	private Date reg_date;
	private String reg_screen;
	private int mod_member_idx;
	private Date mod_date;
	private String mod_screen;
	private Date event_applydate;
	private boolean event_win;
	
	public int getEvent_idx() {
		return event_idx;
	}
	public void setEvent_idx(int event_idx) {
		this.event_idx = event_idx;
	}
	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public int getEvent_cnt() {
		return event_cnt;
	}
	public void setEvent_cnt(int event_cnt) {
		this.event_cnt = event_cnt;
	}
	public Date getEvent_startdate() {
		return event_startdate;
	}
	public void setEvent_startdate(Date event_startdate) {
		this.event_startdate = event_startdate;
	}
	public Date getEvent_enddate() {
		return event_enddate;
	}
	public void setEvent_enddate(Date event_enddate) {
		this.event_enddate = event_enddate;
	}
	public int getEvent_hit() {
		return event_hit;
	}
	public void setEvent_hit(int event_hit) {
		this.event_hit = event_hit;
	}
	public String getReg_member_idx() {
		return reg_member_idx;
	}
	public void setReg_member_idx(String reg_member_idx) {
		this.reg_member_idx = reg_member_idx;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getReg_screen() {
		return reg_screen;
	}
	public void setReg_screen(String reg_screen) {
		this.reg_screen = reg_screen;
	}
	public int getMod_member_idx() {
		return mod_member_idx;
	}
	public void setMod_member_idx(int mod_member_idx) {
		this.mod_member_idx = mod_member_idx;
	}
	public Date getMod_date() {
		return mod_date;
	}
	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}
	public String getMod_screen() {
		return mod_screen;
	}
	public void setMod_screen(String mod_screen) {
		this.mod_screen = mod_screen;
	}
	public Date getEvent_applydate() {
		return event_applydate;
	}
	public void setEvent_applydate(Date event_applydate) {
		this.event_applydate = event_applydate;
	}
	public boolean isEvent_win() {
		return event_win;
	}
	public void setEvent_win(boolean event_win) {
		this.event_win = event_win;
	}
	
	
}
