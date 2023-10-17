package kr.co.book.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.admin.service.AdminMemberService;

@Controller
public class AdminMemberController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AdminMemberService adminMemberService;
	
	@RequestMapping("/admin/adminMember")
	public String adminMember(){
		return "/admin/adminMember";
	}
	
	@RequestMapping("/admin/adminMemberList.ajax")
	@ResponseBody
	public HashMap<String, Object> adminMemberListAjax(@RequestParam String page,@RequestParam String searchText,@RequestParam String searchType,@RequestParam String member_state){
		logger.info("page : "+page);
		logger.info("searchText : "+searchText);
		logger.info("searchType : "+searchType);
		logger.info("member_state : "+member_state);
		
		
		HashMap<String, Object> adminMember = adminMemberService.adminMemberList(page,member_state,searchType,searchText);
		
		return adminMember;
	}
	
	@RequestMapping("/admin/grade.ajax")
	@ResponseBody
	public HashMap<String, Object> grade(@RequestParam String member_grade, @RequestParam String member_idx){
		logger.info("member_grade : "+member_grade);
		logger.info("member_idx : "+member_idx);
		adminMemberService.grade(member_grade,member_idx);
		HashMap<String, Object> adminMember = new HashMap<String, Object>();
		
		return adminMember;
	}
	
	@RequestMapping("/admin/resetNickname.ajax")
	@ResponseBody
	public HashMap<String, Object> resetNickname(@RequestParam(value="resetList[]") ArrayList<String> resetList){
		
		HashMap<String, Object> adminMember = adminMemberService.resetNickname(resetList);
		
		return adminMember;
	}
}
