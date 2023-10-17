package kr.co.book.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.admin.service.AdminReportService;

@Controller
public class AdminReportController {
	
	@Autowired AdminReportService adminReportService;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/reportPop.go")
	public String reportPopGo(Model model, String code, String idx) {
		
		model.addAttribute("code",code);
		model.addAttribute("idx",idx);
		
		return "reportPop";
	}
	
	@PostMapping(value = "/reportSend.ajax")
	@ResponseBody
	public HashMap<String, Object> reportSend(HttpSession session, @RequestParam HashMap<String, Object> params) {
		
		int member_idx = (int) session.getAttribute("loginIdx");
		params.put("member_idx", member_idx);
		
		return adminReportService.reportSend(params);
	}

	@RequestMapping(value = "/admin/adminReport.go")
	public String reportListGo() {
		return "/admin/adminReport";
	}
	
	@PostMapping(value = "/admin/reportList.ajax")
	@ResponseBody
	public HashMap<String, Object> reportList(@RequestParam HashMap<String, Object> params) {
		return adminReportService.reportList(params);
	}
	
	@RequestMapping(value = "/admin/adminReportDetail.go")
	public ModelAndView adminReportDetailGo(@RequestParam HashMap<String, Object> params) {	
		logger.info("params : "+params);
		return adminReportService.getReportInfor(params);
	}
	
	@PostMapping(value = "/admin/reportRecordList.ajax")
	@ResponseBody
	public HashMap<String, Object> reportRecordList(@RequestParam HashMap<String, Object> params) {
		logger.info("params : "+params);
		return adminReportService.reportRecordList(params);
	}
	
	@PostMapping(value = "/admin/reportHandling.ajax")
	@ResponseBody
	public HashMap<String, Object> reportHandling(HttpSession session, @RequestParam HashMap<String, Object> params) {
		params.put("member_idx", session.getAttribute("loginIdx"));
		logger.info("params : "+params);
		return adminReportService.reportHandling(params);
	}
	
	
	
	
	
}
