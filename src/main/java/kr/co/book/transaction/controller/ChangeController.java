package kr.co.book.transaction.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.book.transaction.service.ChangeService;

@Controller
public class ChangeController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ChangeService service;

	// 교환신청
	@RequestMapping(value="/changeapply.do", method = RequestMethod.POST)
	public String changeapply(HttpSession session,@RequestParam HashMap<String, Object> params) {
		
		logger.info("{}",params);
		String member_idx = session.getAttribute("loginIdx").toString();
		params.put("member_idx", member_idx);
		
		service.changeapply(params);				
		
		return "/transactionDone";
	}
	
	// 교환 약속 시
	@RequestMapping(value="/changereservation.do")
	public String changereservation(@RequestParam HashMap<String, Object> params, HttpSession session) {
		
		params.put("MOD_MEMBER_IDX", (session.getAttribute("loginIdx").toString()));
		
		service.changereservation(params);
		return "/Library/libraryDone";		
	}
	
}
