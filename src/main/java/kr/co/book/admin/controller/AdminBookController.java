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

import kr.co.book.admin.service.AdminBookService;

@Controller
public class AdminBookController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminBookService adminBookService;
	
	@RequestMapping("/admin/adminBook")
	public String adminBook(){
		return "/admin/adminBook";
	}
	
	@RequestMapping("/admin/adminBookList.ajax")
	@ResponseBody
	public HashMap<String, Object> adminBookListAjax(@RequestParam String page,@RequestParam String searchText){
		logger.info("searchText : "+searchText);
		HashMap<String, Object> adminBook = adminBookService.adminBookList(page,searchText);
		
		return adminBook;
	}
	
	
	@RequestMapping("/admin/resetBookInfo.ajax")
	@ResponseBody
	public HashMap<String, Object> resetBookInfoAjax(@RequestParam(value="resetList[]") ArrayList<String> resetList){
		HashMap<String, Object> map = adminBookService.resetBookInfo(resetList);
		return map; 
	}
	
	@RequestMapping("/admin/bookBlind.ajax")
	@ResponseBody
	public HashMap<String, Object> bookBlindAjax(@RequestParam String blind,@RequestParam String library_idx){
		logger.info("blind : "+blind);
		logger.info("library_idx : "+library_idx);
		adminBookService.bookBlind(blind,library_idx);
		HashMap<String, Object> adminBook = new HashMap<String, Object>();
		
		return adminBook;
	}
}
