package kr.co.book.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.mypage.dao.DepositDAO;
import kr.co.book.mypage.dto.DepositDTO;

@Service

public class DepositService {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired DepositDAO depositDAO;
	
	public HashMap<String, Object> depositUseList(int member_idx,String sPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();	
		ArrayList<DepositDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 9*(page-1);
		int total = 0;
		
		total = depositDAO.totalListCnt(member_idx);
		list = depositDAO.depositUseList(member_idx,offset);
		int range = total%9  == 0 ? total/9 : total/9+1;
		page = page>range ? range:page;
		map.put("offset", offset);
		map.put("list", list);
		map.put("currPage", page);
		map.put("pages", range);
		
		return map;         
	}

	public int depositNow(int member_idx) {
		return depositDAO.depositNow(member_idx);
	}

	public String getPw(int member_idx) {
		return depositDAO.getPw(member_idx);
	}

	public ArrayList<HashMap<String, String>> bankList() {
		return depositDAO.bankList();
	}

	public void depositWithdrawReq(HashMap<String, String> data) {
		//deposit 테이블에 출금 요청
		depositDAO.depositWithdrawReq(data);
		
		//deposit_use 테이블에서 출금
		int deposit_use_price = Integer.parseInt(data.get("deposit_price"));
		
		if(data.get("deposit_type").equals("출금")) {
			deposit_use_price *= -1; 
		}
		
		data.put("deposit_use_price", String.valueOf(deposit_use_price));
		data.put("deposit_use_state", data.get("deposit_type"));
		 
		depositDAO.depositUse(data);
	}

	public void depositChargedrawReq(HashMap<String, String> data) {
		//deposit 테이블에 충전 요청
		depositDAO.depositChargedrawReq(data);
		
		//deposit_use 테이블에서 충전
		String deposit_use_price = data.get("deposit_price");
		data.put("deposit_use_price", String.valueOf(deposit_use_price));
		data.put("deposit_use_state", data.get("deposit_type"));
		
		depositDAO.depositUse(data);
	}

	
}
