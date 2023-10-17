package kr.co.book.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.admin.dao.AdminDepositDAO;
import kr.co.book.admin.dto.AdminDepositDTO;

@Service
@MapperScan(value = {"kr.co.book.admin.dao"})
public class AdminDepositService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AdminDepositDAO adminDepositDAO;

	public HashMap<String, Object> adminBookList(String sPage,String deposit_type) {
		HashMap<String, Object> adminDeposit = new HashMap<String, Object>();	
		ArrayList<AdminDepositDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 10*(page-1);
		int total = 0;
		
		total = adminDepositDAO.totalAdminDeposit(deposit_type);
		list = adminDepositDAO.adminDepositList(offset,deposit_type);
		
		int range = total%10  == 0 ? total/10 : total/10+1;
		page = page>range ? range:page;
		adminDeposit.put("offset", offset);
		adminDeposit.put("list", list);
		adminDeposit.put("currPage", page);
		adminDeposit.put("pages", range);
		
		return adminDeposit;
	}

}
