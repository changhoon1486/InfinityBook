package kr.co.book.admin.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("adminDeposit")
public class AdminDepositDTO {
	private int deposit_idx;
	private int member_idx;
	private String deposit_type;
	private String deposit_method;
	private String deposit_info;
	private String deposit_date;
	public String getDeposit_date() {
		return deposit_date;
	}
	public void setDeposit_date(String deposit_date) {
		this.deposit_date = deposit_date;
	}
	private int deposit_price;
	private String deposit_state;
	
	public int getDeposit_idx() {
		return deposit_idx;
	}
	public void setDeposit_idx(int deposit_idx) {
		this.deposit_idx = deposit_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getDeposit_type() {
		return deposit_type;
	}
	public void setDeposit_type(String deposit_type) {
		this.deposit_type = deposit_type;
	}
	public String getDeposit_method() {
		return deposit_method;
	}
	public void setDeposit_method(String deposit_method) {
		this.deposit_method = deposit_method;
	}
	public String getDeposit_info() {
		return deposit_info;
	}
	public void setDeposit_info(String deposit_info) {
		this.deposit_info = deposit_info;
	}


	public int getDeposit_price() {
		return deposit_price;
	}
	public void setDeposit_price(int deposit_price) {
		this.deposit_price = deposit_price;
	}
	public String getDeposit_state() {
		return deposit_state;
	}
	public void setDeposit_state(String deposit_state) {
		this.deposit_state = deposit_state;
	}
	
	
	
}
