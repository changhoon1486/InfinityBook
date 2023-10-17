package kr.co.book.main.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.book.main.dto.MainDTO;
import kr.co.book.main.service.MainService;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired MainService mainService;
	
	@RequestMapping(value = "/sample")
	public String sample() {
		return "sample";
	}

	@RequestMapping(value = "/")
	public String Main(Model model) {
		
		ArrayList<MainDTO> report = mainService.popularReport();
		ArrayList<MainDTO> library = mainService.popularLibrary();
		
		model.addAttribute("report", report);
		model.addAttribute("library", library);
		return "index";
	}
	
	
	
	
	
	
	
	
	

}
