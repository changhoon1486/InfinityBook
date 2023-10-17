package kr.co.book.admin.dto;

import org.apache.ibatis.type.Alias;

@Alias("adminCode")

public class AdminCodeDTO {
	private String code_idx;
	private String code_upcode;
	private String code_code;
	private String code_codename;
	public String getCode_upcode() {
		return code_upcode;
	}
	public void setCode_upcode(String code_upcode) {
		this.code_upcode = code_upcode;
	}
	public String getCode_code() {
		return code_code;
	}
	public void setCode_code(String code_code) {
		this.code_code = code_code;
	}
	public String getCode_codename() {
		return code_codename;
	}
	public void setCode_codename(String code_codename) {
		this.code_codename = code_codename;
	}
	public String getCode_idx() {
		return code_idx;
	}
	public void setCode_idx(String code_idx) {
		this.code_idx = code_idx;
	}
	
	
}
