package kr.co.book.admin.service;

import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.admin.dao.AdminNoticeDAO;

@Service
@MapperScan(value={"kr.co.book.admin.dao"})
public class AdminNoticeService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminNoticeDAO dao;

	//공지 작성
	public void noticewrite(HashMap<String, Object> params) {
		
		dao.noticewrite(params);
		
	}

	// 공지 수정
	public void noticeupdate(HashMap<String, Object> params) {

		dao.noticeupdate(params);
	}
	
	// 공지 블라인드
	public void noticedel(String notice_idx) {
		
		dao.noticedel(notice_idx);
		
	}

}
