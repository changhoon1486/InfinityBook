package kr.co.book.alarm.controller;



import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.alarm.service.AlarmService;

@Controller
public class AlarmController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AlarmService service;
	
	@RequestMapping(value="/alarm.ajax")
	@ResponseBody
	public ModelAndView alarm(HttpSession session) {
		String member_idx = session.getAttribute("loginIdx").toString();
		ModelAndView mav = new ModelAndView("alarm/alarmList");
		mav.addObject("alarmlist", service.alarmlist(member_idx));
		return mav;
	}
			
	@RequestMapping(value="/alarmdetail.go")
	public String alarmdetail(@RequestParam int code_idx, @RequestParam long idx) {
		
		logger.info(code_idx+"/"+idx);
		
		String page = service.alarmdetail(code_idx, idx);
		
		return page;
	}
	
	@RequestMapping(value="/alarmchk.ajax")
	@ResponseBody
	public int alarmchk(HttpSession session) {
		String member_idx = session.getAttribute("loginIdx").toString();
		int count = service.alarmchk(member_idx);
		return count;
	}
	
	// 알람 전체 삭제
	@RequestMapping(value="/alarmdel_all.ajax")
	@ResponseBody
	public long alarmdel_all(HttpSession session) {
		String member_idx = session.getAttribute("loginIdx").toString();
		long i = service.alarmdel_all(member_idx);
		
		return i;
	}
	// 알람 하나 삭제
	@RequestMapping(value="/alarmdel.ajax")
	@ResponseBody
	public String alarmdel(@RequestParam String alarm_idx) {
		service.alarmdel(alarm_idx);
		return "index";
	}
	// 문의 답변 알림
	
	

}
