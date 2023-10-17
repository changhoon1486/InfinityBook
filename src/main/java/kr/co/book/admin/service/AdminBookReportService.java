package kr.co.book.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.admin.dao.AdminBookReportDAO;
import kr.co.book.admin.dto.AdminBookDTO;

@Service
@MapperScan(value = {"kr.co.book.admin.dao"}) 
public class AdminBookReportService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AdminBookReportDAO adminBookReportDAO;
	
	public HashMap<String, Object> adminBookReportList(String sPage, String searchText) {
		HashMap<String, Object> adminClub = new HashMap<String, Object>();	
		ArrayList<AdminBookDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 10*(page-1);
		int total = 0;
		
		if(searchText.equals("")) {
			total = adminBookReportDAO.totalAdminBookReport();
			list = adminBookReportDAO.adminBookReportList(offset);
		}else {
			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("offset", offset);
			data.put("searchText", searchText);
			logger.info("data"+data);
			total = adminBookReportDAO.totalAdminBookReportSearch(data);
			list = adminBookReportDAO.adminBookReportListSearch(data);
		}
		
		int range = total%10  == 0 ? total/10 : total/10+1;
		page = page>range ? range:page;
		adminClub.put("offset", offset);
		adminClub.put("list", list);
		adminClub.put("currPage", page);
		adminClub.put("pages", range);
		
		return adminClub;
	}

	public void bookReportBlind(String blind, String book_report_idx) {
		adminBookReportDAO.bookReportBlind(blind,book_report_idx);
		
	}
}
