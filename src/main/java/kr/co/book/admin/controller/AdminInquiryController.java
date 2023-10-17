package kr.co.book.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.admin.dto.AdminInquiryDTO;
import kr.co.book.admin.service.AdminInquiryService;
import kr.co.book.mypage.dto.MyInquriyDTO;
import kr.co.book.mypage.service.MyInquiryService;

@Controller
public class AdminInquiryController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminInquiryService service;
	@Autowired MyInquiryService mservice;
	
	// 문의 상세보기
	@RequestMapping(value = "/admin/inquirydetail.go")
	public ModelAndView inquirydetail(@RequestParam String inquiry_idx) {
		
		ModelAndView mav = new ModelAndView("/inquiry/inquirylist");
		AdminInquiryDTO dto =  service.inquirydetail(inquiry_idx);
		if (dto != null) {
			mav.addObject("inquiry", dto);
			mav.setViewName("/inquiry/inquirydetail");
		}
		
		return mav;
	}
	
	// 문의 답변 이동
	@RequestMapping(value = "/admin/inquiryreplywrite.go")
	public String inquiryreplywriteForm(@RequestParam String inquiry_idx,@RequestParam String code_idx,@RequestParam String member_i,@RequestParam String inq_title,Model model) {
		logger.info(inquiry_idx+"/"+code_idx);
		model.addAttribute("inquiry_idx", inquiry_idx);
		model.addAttribute("code_idx", code_idx);
		model.addAttribute("member_i", member_i);
		model.addAttribute("inq_title", inq_title);
		return "/inquiry/inquiryreplywrite";
	}
	
	// 문의 답변 하기
	@RequestMapping(value = "/admin/inquiryreplywrite.do")
	public String inquiryreplywrite(@RequestParam HashMap<String, Object> params, HttpSession session) {
		
		String loginIdx = session.getAttribute("loginIdx").toString();
		params.put("member_idx", loginIdx);
		service.inquiryreplywrite(params);
		
		return "/admin/adminInquiry";
	}	
	
	// 문의 리스트
	@RequestMapping(value = "/admin/inquirylist.go")
	public String myinquirylistForm() {		
		
		return "/admin/adminInquiry";
	}
	
	// 문의 리스트 불러오기
	@RequestMapping(value = "/admin/inquirylist.ajax")
	@ResponseBody
	public HashMap<String, Object> myinquirylist(@RequestParam HashMap<String,Object> params) {
		logger.info("{}",params);

		HashMap<String, Object> inquiry = service.inquiryList(params);
		
		return inquiry;
	}
	
	// 문의 답변 상세보기
	@RequestMapping(value = "/admin/inquiryreplydetail.go")
	public ModelAndView inquiryreplydetail(@RequestParam String inquiry_idx) {
		
		ModelAndView mav = new ModelAndView("/admin/adminInquiry");		

		MyInquriyDTO dto =  mservice.myinquiryreplydetail(inquiry_idx);
		
		if (dto != null) {
			mav.addObject("inquiry", dto);
			mav.setViewName("/inquiry/inquirydetail");
		}
		
		return mav;
	}
	
	

}
