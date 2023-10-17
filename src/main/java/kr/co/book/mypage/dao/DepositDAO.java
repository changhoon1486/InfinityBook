package kr.co.book.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.mypage.dto.DepositDTO;

@Mapper
public interface DepositDAO {

	int totalListCnt(int member_idx);

	ArrayList<DepositDTO>depositUseList(int member_idx, int offset);

	int depositNow(int member_idx);

	ArrayList<HashMap<String, String>> bankList();

	void depositWithdrawReq(HashMap<String, String> data);

	void depositUse(HashMap<String, String> data);

	void depositChargedrawReq(HashMap<String, String> data);

	String getPw(int member_idx);

}
