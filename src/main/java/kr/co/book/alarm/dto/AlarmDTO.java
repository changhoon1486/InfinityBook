package kr.co.book.alarm.dto;

import org.apache.ibatis.type.Alias;

@Alias("alarm")
public class AlarmDTO {

	//Alarm
	private String alarm_idx;
	private String code_idx;
	private String idx;
	private String alarm_content;
	private String alarm_check;
	private String alarm_date;
	
	
	public String getAlarm_idx() {
		return alarm_idx;
	}
	public void setAlarm_idx(String alarm_idx) {
		this.alarm_idx = alarm_idx;
	}
	public String getCode_idx() {
		return code_idx;
	}
	public void setCode_idx(String code_idx) {
		this.code_idx = code_idx;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getAlarm_content() {
		return alarm_content;
	}
	public void setAlarm_content(String alarm_content) {
		this.alarm_content = alarm_content;
	}
	public String getAlarm_check() {
		return alarm_check;
	}
	public void setAlarm_check(String alarm_check) {
		this.alarm_check = alarm_check;
	}
	public String getAlarm_date() {
		return alarm_date;
	}
	public void setAlarm_date(String alarm_date) {
		this.alarm_date = alarm_date;
	}
	
	
	
	
	
	
}
