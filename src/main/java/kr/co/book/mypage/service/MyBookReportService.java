package kr.co.book.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.mypage.dao.MyBookReportDAO;
import kr.co.book.mypage.dto.MyBookReportDTO;


@Service
public class MyBookReportService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MyBookReportDAO myBookReportDAO;

	public HashMap<String, Object> myBookReportList(int member_idx, String sPage, String searchText) {	
		HashMap<String, Object> myBookreport = new HashMap<String, Object>();	
		ArrayList<MyBookReportDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 9*(page-1);
		int total = 0;
		
		if(searchText.equals("")) {
			total = myBookReportDAO.totalMyBookrport(member_idx);
			list = myBookReportDAO.myBookreport(member_idx,offset);
		}else {
			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("member_idx", member_idx);
			data.put("offset", offset);
			data.put("searchText", searchText);
			logger.info("data"+data);
			total = myBookReportDAO.totalMyBookrportSearch(data);
			list = myBookReportDAO.myBookReportSearch(data);
		}
		
		int range = total%9  == 0 ? total/9 : total/9+1;
		page = page>range ? range:page;
		myBookreport.put("offset", offset);
		myBookreport.put("list", list);
		myBookreport.put("currPage", page);
		myBookreport.put("pages", range);
		
		return myBookreport;
	}

	public HashMap<String, Object> myLikeList(int member_idx, String sPage, String searchText) {
		HashMap<String, Object> myLike = new HashMap<String, Object>();	
		ArrayList<MyBookReportDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 10*(page-1);
		int total = 0;
		
		if(searchText.equals("")) {
			total = myBookReportDAO.totalMyLike(member_idx);
			list = myBookReportDAO.myLike(member_idx,offset);
		}else {
			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("member_idx", member_idx);
			data.put("offset", offset);
			data.put("searchText", searchText);
			logger.info("data"+data);
			total = myBookReportDAO.totalMyLikeSearch(data);
			list = myBookReportDAO.myLikeSearch(data);
		}
		
		int range = total%9  == 0 ? total/10 : total/10+1;
		page = page>range ? range:page;
		myLike.put("offset", offset);
		myLike.put("list", list);
		myLike.put("currPage", page);
		myLike.put("pages", range);
		
		return myLike;
	}		
	
	public HashMap<String, Object> deleteMyBookreport(ArrayList<String> delList) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		int successCnt = 0;
		for (String book_report_idx : delList) {
			successCnt += myBookReportDAO.deleteMyBookreport(book_report_idx);
		}
		map.put("msg", successCnt+" 개 삭제 되었습니다.");	
		map.put("success", true);
		return map;
	}

}
