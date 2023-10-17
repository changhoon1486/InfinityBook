package kr.co.book.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.mypage.service.CalenderService;

@Controller
public class CalenderController {
	
	@Autowired CalenderService CalenderService;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/mypage/calender.go")
	public String calenderPageGo() {
		return "calender";
	}
	
	@GetMapping(value = "/mypage/calendarGetEvents.ajax")
	@ResponseBody
	public HashMap<String, Object> calendarGetEvents(HttpSession session){
		int loginIdx = (int) session.getAttribute("loginIdx");
		logger.info("loginIdx : "+loginIdx);
		return CalenderService.calendarGetEvents(loginIdx);
	}
}
