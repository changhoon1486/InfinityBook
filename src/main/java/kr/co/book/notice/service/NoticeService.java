package kr.co.book.notice.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.book.notice.dao.NoticeDAO;
import kr.co.book.notice.dto.NoticeDTO;

@Service
@MapperScan(value={"kr.co.book.notice.dao"})
public class NoticeService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired NoticeDAO dao;
	
	// 공지사항 리스트
	public HashMap<String, Object> noticelist(int page) {
		
		ArrayList<NoticeDTO> list = null;
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int offset = 0;
		int total = 0;
		int range = 0;
		offset = 10*(page - 1);		
		total =dao.totalnoticeCount();
		range = total%10  == 0 ? total/10 : (total/10)+1;	
		page = page>range ? range:page;
		list = dao.noticeList(offset);
		
		map.put("offset", offset);
		map.put("list", list);
		// 현재 페이지
		map.put("currPage", page);
		// 총 페이지 수
		map.put("pages", range);
		
		
		return map;
	}
	// 공지사항 상세보기
	@Transactional
	public NoticeDTO noticedetail(String notice_idx) {
		
		// 조회수 증가
		dao.noticeuphit(notice_idx);
		
		return dao.noticedetail(notice_idx);
	}
	
	

}
