package kr.co.book.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.mypage.service.MyBookReportService;

@Controller
public class MyBookReportController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MyBookReportService myBookReportService;
	
	@RequestMapping("/mypage/myBookreportList.get")
	public String myBookreportList() {	
		return "/Library/myBookreportList";
	}
	
	@RequestMapping("/mypage/myBookreportList.ajax")
	@ResponseBody
	public HashMap<String, Object> myBookrpoertListAjax(@RequestParam String page,@RequestParam String searchText,HttpSession session){
		logger.info("searchText : "+searchText);
		
		int member_idx = (int) session.getAttribute("loginIdx");
		HashMap<String, Object> myBookreport = myBookReportService.myBookReportList(member_idx,page,searchText);
		
		return myBookreport;
	}

	@RequestMapping("/mypage/profileBookreportList.ajax")
	@ResponseBody
	public HashMap<String, Object> profileBookreportList(@RequestParam String memberIdx, @RequestParam String page,@RequestParam String searchText){
		logger.info("searchText : "+searchText);

		int member_idx = Integer.parseInt(memberIdx);
		HashMap<String, Object> myBookreport = myBookReportService.myBookReportList(member_idx,page,searchText);
		
		return myBookreport;
	}
	
	@RequestMapping("/mypage/myLikeList.get")
	public String myLikeList() {
		return "/Library/myLikeList";
	}
	
	@RequestMapping("/mypage/myLikeList.ajax")
	@ResponseBody
	public HashMap<String, Object> myLikeListAjax(@RequestParam String page,@RequestParam String searchText,HttpSession session){
		logger.info("searchText : "+searchText);
		int member_idx = (int) session.getAttribute("loginIdx"); 
		HashMap<String, Object> myLike = myBookReportService.myLikeList(member_idx,page,searchText);
		logger.info("mylike :"+myLike);
		return myLike;
	}
	
	@RequestMapping("/mypage/deleteMyBookreport.ajax")
	@ResponseBody
	public HashMap<String, Object> deleteMyBookreport(@RequestParam(value="delList[]") ArrayList<String> delList,HttpSession session){
		HashMap<String, Object> map = myBookReportService.deleteMyBookreport(delList);
		return map; 
	}
	
	
}
