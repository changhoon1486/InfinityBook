package kr.co.book.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.mypage.dto.MyInquriyDTO;
import kr.co.book.mypage.service.MyInquiryService;

@Controller
public class MyInquiryController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyInquiryService service;
	
	// 내 문의 리스트
	@RequestMapping(value = "/mypage/myinquirylist.go")
	public String myinquirylistForm() {		
		
		return "/inquiry/myinquirylist";
	}
	
	// 내 문의 리스트 불러오기
	@RequestMapping(value = "/mypage/myinquirylist.ajax")
	@ResponseBody
	public HashMap<String, Object> myinquirylist(@RequestParam HashMap<String,Object> params, HttpSession session) {
		logger.info("{}",params);
		String member_idx = session.getAttribute("loginIdx").toString();
		params.put("member_idx", member_idx);
		HashMap<String, Object> myinquiry = service.myinquiryList(params);
		
		return myinquiry;
	}
	
	// 문의 작성 이동
	@RequestMapping(value = "/mypage/inquirywrite.go")
	public String inquirywriteForm() {				
		return "/inquiry/inquirywrite";
	}
	
	// 문의 작성 하기
	@RequestMapping(value = "/mypage/inquirywrite.do")
	public String inquirywrite(@RequestParam HashMap<String, Object> params, HttpSession session) {
		String loginIdx = session.getAttribute("loginIdx").toString();
		params.put("member_idx", loginIdx);
		
		service.inquirywrite(params);
		
		return "/inquiry/myinquirylist";
	}
	
	// 내 문의 리스트 상세보기
	@RequestMapping(value = "/mypage/myinquirydetail.go")
	public ModelAndView myinquirydetail(@RequestParam String inquiry_idx) {
		
		ModelAndView mav = new ModelAndView("/inquiry/myinquirylist");		

		MyInquriyDTO dto =  service.myinquirydetail(inquiry_idx);
		
		if (dto != null) {
			mav.addObject("inquiry", dto);
			mav.setViewName("/inquiry/myinquirydetail");
		}
		
		return mav;
	}
	
	// 내 문의 답변 상세보기
	@RequestMapping(value = "/myinquiryreplydetail.go")
	public ModelAndView myinquiryreplydetail(@RequestParam String inquiry_idx) {
		
		ModelAndView mav = new ModelAndView("/inquiry/myinquirylist");		

		MyInquriyDTO dto =  service.myinquiryreplydetail(inquiry_idx);
		
		if (dto != null) {
			mav.addObject("inquiry", dto);
			mav.setViewName("/inquiry/myinquirydetail");
		}
		
		return mav;
	}
	
	
	// 내문의 답변 불러오기
	@RequestMapping(value = "/inquiryreplylist.ajax")
	@ResponseBody
	public HashMap<String, Object> myinquiryreplylist(@RequestParam String inquiry_idx) {
		logger.info(inquiry_idx);
		HashMap<String, Object> reReply = service.myinquiryreplylist(inquiry_idx);
		
		return reReply;
	}
	

}
