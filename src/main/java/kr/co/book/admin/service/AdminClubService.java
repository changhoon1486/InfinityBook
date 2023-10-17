package kr.co.book.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.admin.dao.AdminClubDAO;
import kr.co.book.admin.dto.AdminBookDTO;

@Service
@MapperScan(value = {"kr.co.book.admin.dao"}) 
public class AdminClubService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminClubDAO adminClubDAO;

	public HashMap<String, Object> adminClubList(String sPage, String searchText) {
		HashMap<String, Object> adminClub = new HashMap<String, Object>();	
		ArrayList<AdminBookDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 10*(page-1);
		int total = 0;
		
		if(searchText.equals("")) {
			total = adminClubDAO.totalAdminClub();
			list = adminClubDAO.adminClubList(offset);
		}else {
			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("offset", offset);
			data.put("searchText", searchText);
			logger.info("data"+data);
			total = adminClubDAO.totalAdminClubSearch(data);
			list = adminClubDAO.adminClubListSearch(data);
		}
		
		int range = total%10  == 0 ? total/10 : total/10+1;
		page = page>range ? range:page;
		adminClub.put("offset", offset);
		adminClub.put("list", list);
		adminClub.put("currPage", page);
		adminClub.put("pages", range);
		
		return adminClub;
	}

	public void clubBlind(String blind, String club_idx) {
		adminClubDAO.clubBlind(blind,club_idx);
		
	}


}
