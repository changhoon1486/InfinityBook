package kr.co.book.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.admin.dao.AdminBookDAO;
import kr.co.book.admin.dto.AdminBookDTO;

@Service
@MapperScan(value = {"kr.co.book.admin.dao"}) 
public class AdminBookService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminBookDAO adminBookDAO;

	public HashMap<String, Object> adminBookList(String sPage, String searchText) {
		HashMap<String, Object> adminBook = new HashMap<String, Object>();	
		ArrayList<AdminBookDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 10*(page-1);
		int total = 0;
		
		if(searchText.equals("")) {
			total = adminBookDAO.totalAdminBook();
			list = adminBookDAO.adminBookList(offset);
		}else {
			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("offset", offset);
			data.put("searchText", searchText);
			logger.info("data"+data);
			total = adminBookDAO.totalAdminBookSearch(data);
			list = adminBookDAO.adminBookListSearch(data);
		}
		
		int range = total%10  == 0 ? total/10 : total/10+1;
		page = page>range ? range:page;
		adminBook.put("offset", offset);
		adminBook.put("list", list);
		adminBook.put("currPage", page);
		adminBook.put("pages", range);
		
		return adminBook;
	}

	public void bookBlind(String blind, String library_idx) {
		adminBookDAO.bookBlind(blind,library_idx);
		
	}

	public HashMap<String, Object> resetBookInfo(ArrayList<String> resetList) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		int resetSize = resetList.size();
		int successCnt = 0;
		for (String library_idx : resetList) {
			successCnt += adminBookDAO.resetBookInfo(library_idx);
		}				
		map.put("success", true);
		return map;
		
	}

}
