package kr.co.book.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.admin.service.AdminBookReportService;

@Controller
public class AdminBookReportController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminBookReportService adminBookReportService;
	
	@RequestMapping("/admin/adminBookReport")
	public String adminBookReport(){
		return "/admin/adminBookReport";
	}
	
	 @RequestMapping("/admin/adminBookReportList.ajax")
	 @ResponseBody 
	 public HashMap<String, Object> adminBookListAjax(@RequestParam String page,@RequestParam String searchText){
		 logger.info("searchText : "+searchText); 
		 HashMap<String, Object> adminBookReport = adminBookReportService.adminBookReportList(page,searchText);
		 
		 return adminBookReport; 
	 }
	 
	
	 @RequestMapping("/admin/bookReportBlind.ajax")
	 @ResponseBody
	 public HashMap<String, Object> bookReportBlind(@RequestParam String blind,@RequestParam String book_report_idx){
		 logger.info("blind : "+blind);
		 logger.info("book_report_idx : "+book_report_idx);
		 adminBookReportService.bookReportBlind(blind,book_report_idx);
		 HashMap<String, Object> adminBookReport = new HashMap<String, Object>();
			
		 return adminBookReport;
	}
	
}
