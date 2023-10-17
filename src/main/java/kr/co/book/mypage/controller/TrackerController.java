package kr.co.book.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.mypage.service.TrackerService;

@Controller
public class TrackerController {
	
	@Autowired TrackerService TrackerService;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	//트래커에 추가할 책 검색 페이지 이동
	@RequestMapping(value = "/mypage/trackerSearch.go")
	public String tracker() {		
		return "/tracker/trackerSearch";
	}
	
	@GetMapping(value = "/mypage/clubBookSearch.do")
	public ModelAndView clubBookSearch(String searchValue) {
		return TrackerService.clubBookSearch("title",searchValue);
	}
	
	@GetMapping(value = "/clubBookSearch.do")
	public ModelAndView clubBookSearch2(String searchValue) {
		return TrackerService.clubBookSearch("title",searchValue);
	}
	
	//트래커에 추가할 책 검색
	@GetMapping(value = "/mypage/trackerSearch.do")
	public ModelAndView trackerBookSearch(String searchType, String searchValue) {	
		logger.info("searchType : {} / searchValue : {}",searchType,searchValue);
		return TrackerService.trackerBookSearch(searchType,searchValue);
	}
	
	//트래커 추가 페이지로 이동
	@GetMapping(value = "/mypage/tracker/add/{state}/book.go")
	public String trackerAddBookGo(@RequestParam HashMap<String, Object> params, Model model,@PathVariable String state) {	
		logger.info("trackerAddBookGo params : ",params);
		if(!params.get("isbn").equals("undefined")) {
			model.addAttribute("isbn",params.get("isbn"));
			model.addAttribute("cover",params.get("cover"));
			model.addAttribute("jsp",params.get("jsp"));
		}else {
			model.addAttribute("msg","해당 도서는 추가할 수 없습니다.");
		}
		return "/tracker/trackerAdd"+state+"Book";
	}
	
	//트래커에 완독 / 읽고 있는 책 추가
	@GetMapping(value = "/mypage/tracker/add/{state}/book.ajax")
	@ResponseBody
	public HashMap<String, Object> trackerAddBook(HttpSession session, @PathVariable String state, @RequestParam HashMap<String, Object> params) {
		logger.info("state : {} / params : {}",state,params);
		
		HashMap<String, Object> map =  new HashMap<String, Object>();
		//session.setAttribute("loginIdx", 3);
		int loginIdx = (int) session.getAttribute("loginIdx");
		logger.info("loginIdx : "+loginIdx);
		params.put("loginIdx", loginIdx);
		params.put("state", state);
		
		boolean success = TrackerService.trackerAddBook(params);
		
		map.put("success",success);
		return map;
	}
	
	//읽고 있는 책 등록 페이지에 총페이지 수 가져가기
	@GetMapping(value = "/mypage/getTotalPage.ajax")
	@ResponseBody
	public HashMap<String, Object> getTotalPage(HttpSession session, @RequestParam HashMap<String, Object> params) {
		logger.info("params : "+params);
		
		HashMap<String, Object> map =  new HashMap<String, Object>();
		
		//session.setAttribute("loginIdx", 3);
		int loginIdx = (int) session.getAttribute("loginIdx");
		params.put("loginIdx", loginIdx);
		logger.info("loginIdx : "+loginIdx);
		
		int totalPage = TrackerService.getTotalPage(params);
		logger.info("totalPage : "+totalPage);

		map.put("totalPage",totalPage);
		return map;
	}
	
	//트래커 리스트로 이동
	@GetMapping(value = "/mypage/trackerList.go")
	public ModelAndView trackerListGo(HttpSession session) {
		//session.setAttribute("loginIdx", 3);
		int loginIdx = (int) session.getAttribute("loginIdx");
		logger.info("loginIdx : "+loginIdx);		
		return TrackerService.trackerList(loginIdx);
	}
	
	//트래커 디테일
	@GetMapping(value = "/mypage/trackerDetail.go")
	public ModelAndView trackerDetail(HttpSession session, String trackerIdx) {
		return TrackerService.trackerDetail(trackerIdx);
	}

	//트래커 업데이트 페이지로 이동
	@GetMapping(value = "/mypage/trackerUpdateBook.go")
	public String trackerUpdateBookGo(@RequestParam HashMap<String, Object> params, Model model) {	
		logger.info("params : ",params);
			model.addAttribute("isbn",params.get("isbn"));
			model.addAttribute("readPage",params.get("readPage"));
			model.addAttribute("startDate",params.get("startDate"));
			model.addAttribute("jsp",params.get("jsp"));
		return "/tracker/trackerAddReadingBook";
	}
	
	//트래커 수정
	@GetMapping(value = "/mypage/trackerUpdateBook.ajax")
	@ResponseBody
	public HashMap<String, Object> trackerUpdateBook(HttpSession session, @RequestParam HashMap<String, Object> params) {
		//session.setAttribute("loginIdx", 3);
		int loginIdx = (int) session.getAttribute("loginIdx");
		logger.info("loginIdx : "+loginIdx);		
		params.put("loginIdx", loginIdx);			
		return TrackerService.trackerUpdateBook(params);
	}
	
	//트래커 삭제
	@GetMapping(value = "/mypage/trackerDeleteBook.ajax")
	@ResponseBody
	public HashMap<String, Object> trackerDeleteBook(HttpSession session, String isbn) {
		//session.setAttribute("loginIdx", 3);
		int loginIdx = (int) session.getAttribute("loginIdx");
		logger.info("loginIdx : "+loginIdx);		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(TrackerService.trackerDeleteBook(isbn,loginIdx) == 1) {
			map.put("success", "success");
		}
		
		return map;
	}
	
	//메모 저장
	@PostMapping(value = "/mypage/trackerAddMemo.ajax")
	@ResponseBody
	public HashMap<String, Object> trackerAddMemo(HttpSession session, @RequestParam HashMap<String, Object> params) {
		logger.info("memo params: "+params);
		
		//session.setAttribute("loginIdx", 3);
		int loginIdx = (int) session.getAttribute("loginIdx");
		logger.info("loginIdx : "+loginIdx);	
		
		params.put("loginIdx", loginIdx);
		
		return TrackerService.trackerAddMemo(params);
	}
	
	//메모 리스트 출력
	@PostMapping(value = "/mypage/getMemoList.ajax")
	@ResponseBody
	public HashMap<String, Object> getMemoList(String trackerIdx){
		logger.info("memo trackerIdx : "+trackerIdx);
		return TrackerService.getMemoList(trackerIdx);
	}
	
	//메모 삭제
	@PostMapping(value = "/mypage/memoDelete.ajax")
	@ResponseBody
	public HashMap<String, Object> memoDelete(@RequestParam HashMap<String, Object> params){
		logger.info("memo delete : "+params);
		return TrackerService.memoDelete(params);
	}
	
	//메모 수정 페이지 이동
	@GetMapping(value = "/mypage/trackerMemoUpdate.go")
	public String trackerMemoUpdateGo(@RequestParam HashMap<String, Object> params, Model model) {	
		logger.info("params : ",params);
		String content = TrackerService.getContent(params);
		model.addAttribute("content",content);
		model.addAttribute("trackerIdx",params.get("trackerIdx"));
		model.addAttribute("memoIdx",params.get("memoIdx"));
		model.addAttribute("jsp",params.get("jsp"));
		return "/tracker/trackerMemoUpdate";
	}
	
	//메모 수정
	@PostMapping(value = "/mypage/trackerMemoUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> trackerMemoUpdate(@RequestParam HashMap<String, Object> params){
		logger.info("memo update : "+params);
		return TrackerService.memoUpdate(params);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
