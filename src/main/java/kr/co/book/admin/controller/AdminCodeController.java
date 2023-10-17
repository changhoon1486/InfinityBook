package kr.co.book.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.admin.dto.AdminCodeDTO;
import kr.co.book.admin.service.AdminCodeService;

@Controller
public class AdminCodeController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	AdminCodeService adminCodeService;

	@RequestMapping("/admin/adminCode")
	public String adminBook(Model model) {

		ArrayList<AdminCodeDTO> codeList = adminCodeService.upCodeList();
		model.addAttribute("codeList", codeList);
		return "/admin/adminCode";
	}


	@RequestMapping("/admin/adminCodeList.ajax")
	@ResponseBody public HashMap<String, Object> adminCodeList(@RequestParam String code_upcode){
		HashMap<String, Object> adminCode =adminCodeService.adminCodeList(code_upcode);		 
		return adminCode; 
	}

	@RequestMapping("/admin/upcodeUpdate.ajax")
	@ResponseBody public HashMap<String, Object> upcodeUpdate(@RequestParam String code_idx, @RequestParam String code_upcode){
		
		// 1. code_idx 이용해서 변경 전 code_upcode 찾기 
		String oriUpcode = adminCodeService.findUpcode(code_idx);
		logger.info(oriUpcode);
		// 2. code_upcode = code_upcode인것 수정
		adminCodeService.upcodeUpdate(oriUpcode,code_upcode);
		
		// 3. code_code = code_upcode인 것 수정
		adminCodeService.codeUpdate(oriUpcode,code_upcode);
		
		HashMap<String, Object> data =new HashMap<String, Object>();		 
		data.put("success", true);
		return data; 
	}
	
	@RequestMapping("/admin/codenameUpdate.ajax")
	@ResponseBody public HashMap<String, Object> codenameUpdate(@RequestParam String code_idx, @RequestParam String codename){
		
		// 1. code_idx 이용해서 변경 전 code_upcode 찾기 
		String oriUpcode = adminCodeService.findUpcode(code_idx);
		
		adminCodeService.codenameUpdate(code_idx,codename);
		
		HashMap<String, Object> data =new HashMap<String, Object>();		 
		data.put("upcode", oriUpcode);
		return data; 
	}
}
