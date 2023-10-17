package kr.co.book.transaction.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.book.transaction.service.TransactionListService;

@Controller
public class TransactionListController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired TransactionListService service;

	@GetMapping(value = "/search.do")
	public String search(
			String Query, String QueryType, Model model) {
		
 // http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?
 // ttbkey=ttbtyhn00000921001&Query=안녕&QueryType=Keyword&
 // MaxResults=100&Start=1&Cover=Big&SearchTarget=Book&output=JS
 // &Version=20131101
		String sQuery = Query.replaceAll("\\s", "");
		
		Map<String, Object> result = service.bookSearch(sQuery, QueryType);
		model.addAttribute("result", result);
		
		
		return "BookSearchResult";
		
	}
	
	@GetMapping(value = "/searchUser.do")
	public String searchUser(HttpSession session,
			String Isbn, Model model) {
		
		logger.info("Isbn = "+Isbn);
		String member_idx = session.getAttribute("loginIdx").toString();
		model.addAttribute("RentList", service.searchUserRent(Isbn,member_idx));
		model.addAttribute("ChangeList", service.searchUserChange(Isbn,member_idx));
		
		
		return "BookSearchResultUser";
		
	}
	
	@GetMapping(value = "/searchDetail.do")
	public String searchDetail(
			String library_idx, Model model) {
		
		logger.info("LIBRARY_IDX = "+library_idx);
		
		model.addAttribute("book", service.searchDetail(library_idx));
		model.addAttribute("review", service.searchReview(library_idx));
		
		return "BookSearchResultDetail";
		
	}
	
	@GetMapping(value = "/TransactionRent.do")
	public String TransactionRent(HttpSession session, String library_idx, Model model) {
		String member_idx = session.getAttribute("loginIdx").toString();
		model.addAttribute("book", service.searchDetail(library_idx));
		model.addAttribute("rent_deposit", service.deposit(member_idx));
		
		return "TransactionRent";
	}
	
	@GetMapping(value = "/TransactionChange.do")
	public String TransactionChange(HttpSession session, String library_idx, Model model) {
		String member_idx = session.getAttribute("loginIdx").toString();
		model.addAttribute("mybook", service.change(member_idx));
		model.addAttribute("book", service.searchDetail(library_idx));
		return "TransactionChange";
	}
	
	@RequestMapping("/reportBookPop.go")
	public String reportBookPop() {
		return "reportBookPop";
	}
	
	@RequestMapping("/Review.go")
	public String review(@RequestParam HashMap<String, Object> params, Model model) {
		logger.info("params : "+params);
		String page = "";
		if(((String)params.get("review_type")).equals("0")) {
			page = "UserReview";
		}else {
			page = "BookReview";
		}
		
		model.addAttribute("library", service.searchDetail((String)params.get("book_reciever")));
		model.addAttribute("user",service.getUserNickname((String) params.get("member_reciever")));
		model.addAttribute("param", params);
		// /Review.go?member_sender=(하는사람)1&review_type=0
		// &member_reciever=(받는사람)&book_reciever=(받는책)
		// &review_transaction_type=(대여/교환여부)&review_tracnsaction_idx=(idx)
		
		return page;
	}
	
	@RequestMapping("/{type}Review.do")
	public String reviewWrite(HttpSession session, @PathVariable String type,@RequestParam HashMap<String, Object> params, Model model) {
		logger.info("params : "+params);
		String member_idx = session.getAttribute("loginIdx").toString();
		params.put("member_sender", member_idx);
		service.reviewWrite(params);
		
	return "reviewDone";
	}
	
	@RequestMapping("/BookSearch.go")
	public String BookSearch(Model model) {
		String sQuery="안녕";
		String QueryType="Keyword";
		Map<String, Object> result = service.bookSearch(sQuery, QueryType);
		model.addAttribute("result", result);
		
		return "BookSearch";
	}
}
