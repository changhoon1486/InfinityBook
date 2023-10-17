package kr.co.book.bookReport.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.bookReport.dto.BookReportDTO;
import kr.co.book.bookReport.service.BookReportService;


@Controller
public class BookReportController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BookReportService service;
	
	@PostMapping(value="/BookReportWrite.do")
	public String BookReportWrite(HttpSession session,@RequestParam HashMap<String, Object> params,
			Model model) {
		
		String member_idx = session.getAttribute("loginIdx").toString();
		params.put("member_idx", member_idx);
		
		
		return service.report(params);
	}
	
	@PostMapping(value="/BookReportChange.do")
	public String BookReportChange(HttpSession session,@RequestParam HashMap<String, Object> params,
			Model model) {
		
		String member_idx = session.getAttribute("loginIdx").toString();
		params.put("member_idx", member_idx);
		
		
		return service.report(params);
	}
	
	@GetMapping(value="/BookReportWrite.go")
	public String WriteBookReport() {
		
		return "BookReportWrite";
	}
	
	@GetMapping(value="/BookReportChange.go")
	public String ChangeBookReport() {
		
		return "BookReportChange";
	}
	
	@GetMapping(value="/BookReportList.go")
	public String BookReportList(Model model) {
		
		ArrayList<BookReportDTO> list = service.bookReportList();
		model.addAttribute("report", list);
		
		return "BookReportList";
	}
	
	@GetMapping(value="/BookReportDetail")
	public String BookReportDetail(HttpSession session,String book_report_idx, Model model) {
		
		BookReportDTO dto = service.bookReportDetail(book_report_idx);
		HashMap<String,Object> bookinfo = service.getBookInfo(dto.getIsbn());
		model.addAttribute("book", bookinfo);
		model.addAttribute("report", dto);
		model.addAttribute("like", service.getLike(book_report_idx));
		model.addAttribute("name", service.getName(book_report_idx));
		if(session.getAttribute("loginIdx") != null) {
			String member_idx = session.getAttribute("loginIdx").toString();
			model.addAttribute("myLike", service.myLike(book_report_idx,member_idx));
		}else {
			model.addAttribute("myLike", 0);
		}
		
		return "BookReportDetail";
	}
	
	@RequestMapping("/like.ajax") 
	@ResponseBody
	public HashMap<String, Object> likeCheck(Model model, HttpSession session,@RequestParam String book_report_idx,@RequestParam String like_state) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_idx", session.getAttribute("loginIdx").toString());
		map.put("book_report_idx", book_report_idx);
		map.put("like_state", like_state);
		service.likeCheck(map); 
		HashMap<String, Object> like = new HashMap<String, Object>();
		like.put("like", service.getLike(book_report_idx));
		like.put("success", true);
		return like;
	}

	
	@RequestMapping("/bookReplyList.ajax") 
	@ResponseBody
	public HashMap<String, Object> bookReplyList(@RequestParam String page,@RequestParam String book_report_idx) {
		HashMap<String, Object> reply = service.replyList(page,book_report_idx);
		return reply; 
	}
	
	@RequestMapping("/bookReplyWrite.ajax") 
	@ResponseBody
	public HashMap<String, Object> bookReplyWrite(@RequestParam String book_report_idx,@RequestParam String reply_content,HttpSession session) {
		String member_idx = String.valueOf(session.getAttribute("loginIdx")); 
		service.bookReplyWrite(member_idx,reply_content,book_report_idx);
		HashMap<String, Object> reply = new HashMap<String, Object>();
		reply.put("success", true);
		return reply; 
	}
	
	@RequestMapping("/bookReplyDelete.ajax") 
	@ResponseBody
	public HashMap<String, Object> bookReplyDelete(@RequestParam String reply_idx) {
		
		service.bookReplyDelete(reply_idx);
		HashMap<String, Object> reply = new HashMap<String, Object>();
		reply.put("success", true);
		return reply; 
	}
	
	
	@RequestMapping("/bookReplyUpdate.ajax") 
	@ResponseBody
	public HashMap<String, Object> bookReplyUpdate(@RequestParam String reply_idx,@RequestParam String reply_content) {
		
		service.bookReplyUpdate(reply_idx,reply_content);
		HashMap<String, Object> reply = new HashMap<String, Object>();
		reply.put("success", true);
		return reply; 
	}
	
	@RequestMapping("/bookReReply.ajax") 
	@ResponseBody
	public HashMap<String, Object> bookReReply(@RequestParam String reply_idx,@RequestParam String reply_content,@RequestParam String book_report_idx,HttpSession session) {
		String member_idx = String.valueOf(session.getAttribute("loginIdx")); 
		
		service.bookReReply(member_idx,reply_idx,reply_content);
		
		String bookTitle = service.bookTitle(book_report_idx);
		String replyMemberIdx = service.replyMember(reply_idx);
		
		service.reReplyAlarm(replyMemberIdx,book_report_idx,bookTitle);
		
		HashMap<String, Object> reply = new HashMap<String, Object>();
		reply.put("success", true);
		return reply; 
	}
	
	@RequestMapping("/bookReReplyList.ajax") 
	@ResponseBody
	public HashMap<String, Object> bookReReplyList(@RequestParam String reply_idx) {
		HashMap<String, Object> reReply = service.reReplyList(reply_idx);
		return reReply; 
	}
	


}
