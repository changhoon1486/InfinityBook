package kr.co.book.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.mypage.service.ActivitiesService;

@Controller
public class ActivitiesController {
	
	@Autowired ActivitiesService ActivitiesService;

	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value = "/mypage/activitiesChange.go")
	public String activitiesChange() {
		return "/activities/activitiesChange";
	}
	
	@RequestMapping("/mypage/activitiesChangeList.ajax") 
	@ResponseBody
	public HashMap<String, Object> activitiesChangeList(@RequestParam HashMap<String, Object> params, HttpSession session) {
		int loginIdx = (int) session.getAttribute("loginIdx");
		logger.info("loginIdx : "+loginIdx);
		params.put("loginIdx", loginIdx);
		return ActivitiesService.getChangeList(params); 
	}
	
	@RequestMapping(value = "/mypage/activitiesRent.go")
	public String activitiesRent() {
		return "/activities/activitiesRent";
	}
	
	@RequestMapping("/mypage/activitiesRentList.ajax") 
	@ResponseBody
	public HashMap<String, Object> activitiesRentList(@RequestParam HashMap<String, Object> params, HttpSession session) {
		int loginIdx = (int) session.getAttribute("loginIdx");
		logger.info("loginIdx : "+loginIdx);
		params.put("loginIdx", loginIdx);
		return ActivitiesService.getActivitiesRentList(params); 
	}


}
