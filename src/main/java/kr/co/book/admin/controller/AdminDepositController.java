package kr.co.book.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.admin.service.AdminDepositService;

@Controller
public class AdminDepositController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AdminDepositService adminDepositService;
	
	@RequestMapping("/admin/adminDeposit")
	public String adminDeposit(){
		return "/admin/adminDeposit";
	}
	
	@RequestMapping("/admin/adminDepositList.ajax")
	@ResponseBody
	public HashMap<String, Object> adminDepositListAjax(@RequestParam String page,@RequestParam String deposit_type){
		HashMap<String, Object> adminDeposit = adminDepositService.adminBookList(page,deposit_type);
		
		return adminDeposit;
	}
}
