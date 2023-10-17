package kr.co.book.event.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.book.club.dto.ClubDTO;
import kr.co.book.event.dto.EventDTO;
import kr.co.book.event.service.EventService;

@Controller
public class EventController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	private EventService service;
	
	public EventController(EventService service) {
		this.service = service;
	}

	@RequestMapping(value = "/eventList.go")
	public String EventPage() {
		return "event/eventList";
	}
	
	@RequestMapping(value = "/eventWrite.go")
	public String eventWriteForm() {
		return "event/eventWrite";
	}
	
	@RequestMapping(value = "/eventWrite.do", method = RequestMethod.POST)
	public String eventWrite(HttpSession session ,Model model, @RequestParam HashMap<String, String>params, MultipartFile photo, RedirectAttributes rttr){
		String page = "event/eventWrite";
		  
			params.put("member_idx", session.getAttribute("loginIdx").toString()); 
			
		   if (params.get("event_title").equals("")) {
			rttr.addFlashAttribute("msg","제목을 입력하세요.");
		   }else if (params.get("event_content").equals("")) {
			   rttr.addFlashAttribute("msg","유의사항을 입력하세요.");
		   }else if(params.get("event_startdate").equals("")){
			   rttr.addFlashAttribute("msg","이벤트 시작 날짜를 선택하세요.");
		   }else if (params.get("event_enddate").equals("")) {
			   rttr.addFlashAttribute("msg","이벤트 종료 날짜를 선택하세요.");
		   }else if (params.get("event_cnt").equals("")) {
			   rttr.addFlashAttribute("msg","이벤트 당첨자 수를 선정하세요.");
		   }else {				   
			   int success = service.eventWrite(photo, params);
			   
			   if (success > 0) {
				   rttr.addFlashAttribute("msg","이벤트가 정상적으로 등록되었습니다.");
					page = "event/eventList";
			   }else {
				   rttr.addFlashAttribute("msg","이벤트 등록에 오류가 발생하였습니다.");					
				
			}
			   
			   
		}  
	      return page;
	   }
	
	@RequestMapping(value = "/eventDetail.go")
	public String eventDetail() {
		return "event/eventdetail";
	}
	
	@RequestMapping(value = "/eventUpdate.go")
	public String eventUpdate() {
		return "event/eventUpdate";
	}
	
	@RequestMapping(value = "/eventDelete.do")
	public String eventDelete() {
		return "event/eventWrite"; 
	}

	// 이벤트 리스트 불러오기
		@RequestMapping(value = "/event_list.ajax")
		@ResponseBody
		public HashMap<String, Object> eventlist(@RequestParam int page) {

			HashMap<String, Object> eventlist = service.eventlist(page);
			
			return eventlist;
		}
	
}
