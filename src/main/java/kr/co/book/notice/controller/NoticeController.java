package kr.co.book.notice.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.admin.dto.AdminInquiryDTO;
import kr.co.book.notice.dto.NoticeDTO;
import kr.co.book.notice.service.NoticeService;

@Controller
public class NoticeController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired NoticeService service;
	
	// 공지사항 리스트
	@RequestMapping(value = "/noticelist.go")
	public String noticelistForm() {		
		
		return "/notice/noticelist";
	}
	
	// 공지사항 리스트 불러오기
	@RequestMapping(value = "/noticelist.ajax")
	@ResponseBody
	public HashMap<String, Object> noticelist(@RequestParam int page) {

		HashMap<String, Object> noticelist = service.noticelist(page);
		
		return noticelist;
	}

	// 공지사항 상세보기
	@RequestMapping(value = "/noticedetail.go")
	public ModelAndView noticedetail(@RequestParam String notice_idx) {
		
		ModelAndView mav = new ModelAndView("/notice/noticelist");
		NoticeDTO dto =  service.noticedetail(notice_idx);
		
		if (dto != null) {
			mav.addObject("notice", dto);
			mav.setViewName("/notice/noticedetail");
		}
		
		return mav;	
	}
}
