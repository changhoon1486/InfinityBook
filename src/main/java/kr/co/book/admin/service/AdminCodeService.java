package kr.co.book.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.admin.dao.AdminCodeDAO;
import kr.co.book.admin.dto.AdminBookDTO;
import kr.co.book.admin.dto.AdminCodeDTO;

@Service
@MapperScan(value = {"kr.co.book.admin.dao"}) 
public class AdminCodeService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AdminCodeDAO adminCodeDAO;

	public ArrayList<AdminCodeDTO> upCodeList() {
		return adminCodeDAO.upCodeList();
	}

	public HashMap<String, Object> adminCodeList(String code_upcode) {
		HashMap<String, Object> adminCode = new HashMap<String, Object>();	
		ArrayList<AdminBookDTO> list = null;
		list = adminCodeDAO.adminCodeList(code_upcode);
		adminCode.put("list", list);
				
		return adminCode;
	}

	public String findUpcode(String code_idx) {
		return adminCodeDAO.findUpcode(code_idx);
	}

	public void upcodeUpdate(String oriUpcode, String code_upcode) {
		adminCodeDAO.upcodeUpdate(oriUpcode,code_upcode);
	}

	public void codeUpdate(String oriUpcode, String code_upcode) {
		adminCodeDAO.codeUpdate(oriUpcode,code_upcode);
		
	}

	public void codenameUpdate(String code_idx, String codename) {
		adminCodeDAO.codenameUpdate(code_idx,codename);
	}

}
