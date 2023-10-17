package kr.co.book.mypage.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("deposit")
public class DepositDTO {
	
	private int deposit_use_idx;
	private int member_idx;
	private int deposit_use_price;
	private String deposit_use_state;
	private Date deposit_use_date;
	private int rent_idx;
	
	
	public int getDeposit_use_idx() {
		return deposit_use_idx;
	}
	public void setDeposit_use_idx(int deposit_use_idx) {
		this.deposit_use_idx = deposit_use_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getDeposit_use_price() {
		return deposit_use_price;
	}
	public void setDeposit_use_price(int deposit_use_price) {
		this.deposit_use_price = deposit_use_price;
	}
	public String getDeposit_use_state() {
		return deposit_use_state;
	}
	public void setDeposit_use_state(String deposit_use_state) {
		this.deposit_use_state = deposit_use_state;
	}
	public Date getDeposit_use_date() {
		return deposit_use_date;
	}
	public void setDeposit_use_date(Date deposit_use_date) {
		this.deposit_use_date = deposit_use_date;
	}
	public int getRent_idx() {
		return rent_idx;
	}
	public void setRent_idx(int rent_idx) {
		this.rent_idx = rent_idx;
	}
	
	
}
