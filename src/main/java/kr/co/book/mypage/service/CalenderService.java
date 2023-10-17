package kr.co.book.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.mypage.dao.CalenderDAO;
import kr.co.book.mypage.dto.CalenderDTO;

@Service
@MapperScan(value = {"kr.co.book.mypage.dao"}) 
public class CalenderService {
	
	@Autowired CalenderDAO CalenderDAO;

	Logger logger = LoggerFactory.getLogger(getClass());

	public HashMap<String, Object> calendarGetEvents(int loginIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<CalenderDTO> totalList = new ArrayList<CalenderDTO>();
		CalenderDTO CalenderDTO = new CalenderDTO();
		
		//대여 일정 리스트
		ArrayList<CalenderDTO> rentList = CalenderDAO.rentEvents(loginIdx);
		
		for (int i = 0; i < rentList.size(); i++) {
			String bookTitle = rentList.get(i).getBookTitle();
			String title = "대여("+bookTitle+")";
			rentList.get(i).setTitle(title);
			rentList.get(i).setBackgroundColor("#c9cba3");
		}
		
		logger.info("rentList : "+rentList.size());
		totalList.addAll(rentList);
		
		//대출 일정 리스트
		ArrayList<CalenderDTO> borrowList = CalenderDAO.borrowEvents(loginIdx);
		
		for (int i = 0; i < borrowList.size(); i++) {
			String bookTitle = borrowList.get(i).getBookTitle();
			logger.info("bookTitle : "+bookTitle);
			String title = "대출("+bookTitle+")";
			logger.info("title : "+title);
			borrowList.get(i).setTitle(title);
			borrowList.get(i).setBackgroundColor("#ffaf87");
		}
		
		logger.info("list : "+borrowList.size());
		totalList.addAll(borrowList);
		
		//교환 일정 리스트
		ArrayList<CalenderDTO> changeList = CalenderDAO.changeEvents(loginIdx);
		
		for (int i = 0; i < changeList.size(); i++) {
			String bookTitle = changeList.get(i).getBookTitle();
			logger.info("bookTitle : "+bookTitle);
			String title = "교환("+bookTitle+")";
			logger.info("title : "+title);
			changeList.get(i).setTitle(title);
			changeList.get(i).setBackgroundColor("#F7E6C4");
		}
		
		logger.info("list : "+changeList.size());
		totalList.addAll(changeList);

		//모임 일정 리스트
		ArrayList<CalenderDTO> clubList = CalenderDAO.clubEvents(loginIdx);
		
		for (int i = 0; i < clubList.size(); i++) {
			String bookTitle = clubList.get(i).getTitle();
			logger.info("bookTitle : "+bookTitle);
			String title = "모임("+bookTitle+")";
			logger.info("title : "+title);
			clubList.get(i).setTitle(title);
		}
		
		logger.info("list : "+clubList.size());
		totalList.addAll(clubList);
				
		logger.info("totalList : "+totalList.size());
		map.put("events", totalList);

		return map;
	}

}
