package kr.co.book.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.admin.service.AdminClubService;

@Controller
public class AdminClubController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminClubService adminClubService;
	
	@RequestMapping("/admin/adminClub")
	public String adminClub(){
		return "/admin/adminClub";
	}
	

	 @RequestMapping("/admin/adminClubList.ajax")
	 @ResponseBody 
	 public HashMap<String, Object> adminBookListAjax(@RequestParam String page,@RequestParam String searchText){
		 logger.info("searchText : "+searchText); 
		 HashMap<String, Object> adminClub = adminClubService.adminClubList(page,searchText);
		 
		 return adminClub; 
	 }
	
	 @RequestMapping("/admin/clubBlind.ajax")
		@ResponseBody
		public HashMap<String, Object> clubBlindAjax(@RequestParam String blind,@RequestParam String club_idx){
			logger.info("blind : "+blind);
			logger.info("club_idx : "+club_idx);
			adminClubService.clubBlind(blind,club_idx);
			HashMap<String, Object> adminClub = new HashMap<String, Object>();
			
			return adminClub;
		}
}
