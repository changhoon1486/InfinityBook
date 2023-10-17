package kr.co.book.alarm.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.book.alarm.dao.AlarmDAO;
import kr.co.book.alarm.dto.AlarmDTO;

@Service
@MapperScan(value={"kr.co.book.alarm.dao"})
public class AlarmService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AlarmDAO dao;

	@Transactional
	public HashMap<String, Object> alarmlist(String member_idx) {
		
		ArrayList<AlarmDTO> list = null;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		list = dao.alarmList(member_idx);
		dao.alarmCheck(member_idx);

		map.put("list", list);

		return map;
	}

	public String alarmdetail(int code_idx, long idx) {
		
		String page = "";
		
		if(code_idx == 75) {
			// 모임 신청 알림
			page = "redirect:/clubDetail.go?club_idx="+idx;
		}else if(code_idx == 76) {
			// 위시 도서 알림
			page = "redirect:/search.do?QueryType=Keyword&Query="+idx;
		}else if(code_idx == 77) {
			// 이벤트 당첨 알림 이벤트안함.
		}else if(code_idx == 78) {
			// 문의 답변 알림
			page = "redirect:/mypage/myinquirylist.go";			
		}else if(code_idx == 79) {
			// 교환대여 알림
			page = "redirect:/"+idx;
		}else if(code_idx == 80) {
			// 감상문 알림
			page = "redirect:/"+idx;
		}else if(code_idx == 81) {
			// 리뷰 알림
			page = "redirect:/"+idx;
		}else if(code_idx == 82) {
			// 제재 알림
			page = "redirect:/"+idx;
		}else if(code_idx == 83) {
			// 감상문 댓글 알림
			page = "redirect:/"+idx;
		}else if(code_idx == 84) {
			// 감상문 답글 
			page = "redirect:/"+idx;
		}else if(code_idx == 85) {
			// 제재 알림
			page = "redirect:/"+idx;
		}
		
		
		return page;
	}
	
	// 알림 읽음 처리
	public int alarmchk(String member_idx) {

		return dao.alarmchk(member_idx);
	}

	// 알림 전체 삭제
	public long alarmdel_all(String member_idx) {
		
		return dao.alarmdel_all(member_idx);
	}

	// 알림 하나 삭제
	public int alarmdel(String alarm_idx) {

		return dao.alarmdel(alarm_idx);
	}


}
