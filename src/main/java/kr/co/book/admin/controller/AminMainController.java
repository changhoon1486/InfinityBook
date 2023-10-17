package kr.co.book.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AminMainController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/admin/adminMain")
	public String adminMain() {
		return "/admin/adminMain";
	}
	
	
}
