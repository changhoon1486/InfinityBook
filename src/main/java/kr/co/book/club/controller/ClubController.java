package kr.co.book.club.controller;

import java.util.ArrayList;
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

import kr.co.book.chat.service.ChatService;
import kr.co.book.club.dto.ClubDTO;
import kr.co.book.club.service.ClubService;
import kr.co.book.mypage.service.TrackerService;



@Controller
public class ClubController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ClubService clubService;
	
	@Autowired TrackerService TrackerService;
	
	@Autowired ChatService chatservice;
	
	@RequestMapping("/clubList.go")
	public String clubListGo() {
		return "/club/clubList";
	}
	
	@RequestMapping("/myClubList.go")
	public String myClubListGo() {
		return "/club/myClubList";
	}
	
	@RequestMapping("/clubList.ajax") 
	@ResponseBody
	public HashMap<String, Object> clubListAjax(@RequestParam String page,@RequestParam String searchText) {
		HashMap<String, Object> clubs = clubService.clubList(page,searchText);
		return clubs; 
	}
	
	@RequestMapping("/clubDetail.go")
	public String clubDetail(@RequestParam String club_idx, Model model, HttpSession session) {
		
		ClubDTO club = clubService.clubDetail(club_idx);
		ArrayList<ClubDTO> member = clubService.clubMember(club_idx);
		ArrayList<ClubDTO> apply = clubService.applyMember(club_idx);
		model.addAttribute("club", club);
		model.addAttribute("member", member);
		model.addAttribute("apply", apply);
		model.addAttribute("loginIdx", session.getAttribute("loginIdx"));
		return "/club/clubDetail";
	}
	
	// 신청
	@RequestMapping("/clubApply.do")
	public String clubApply(@RequestParam String club_idx, Model model, HttpSession session){
		
		String member_idx = String.valueOf(session.getAttribute("loginIdx")); 
		
		int chk = clubService.clubApplyChk(club_idx, member_idx);
		
		if(chk==0) {
			clubService.clubApply(club_idx, member_idx);
			model.addAttribute("msg", "신청에 성공했습니다. ");
		}else {
			model.addAttribute("msg", "이미 신청한 모임입니다." );
		}
		
		ClubDTO club = clubService.clubDetail(club_idx);
		ArrayList<ClubDTO> member = clubService.clubMember(club_idx);
		ArrayList<ClubDTO> apply = clubService.applyMember(club_idx);
		model.addAttribute("club", club);
		model.addAttribute("member", member);
		model.addAttribute("apply", apply);
		model.addAttribute("loginIdx", session.getAttribute("loginIdx"));
		
		String clubTitle = clubService.clubTitle(club_idx);
		String writer_idx = clubService.clubWriter(club_idx);
		clubService.applyAlarm(club_idx,writer_idx,clubTitle);
		
		
		return "/club/clubDetail";
	}
	
	// 수락 -> 업데이트
	@RequestMapping("/applyAccept.do")
	public String applyAccept(@RequestParam String club_idx, @RequestParam String member_idx){
		
		clubService.applyAccept(club_idx, member_idx);
		String member_nickname = clubService.findmembernickname(member_idx);
		// 채팅방 입장후 채팅생성		
		chatservice.clubchatjoin(club_idx, Integer.parseInt(member_idx),member_nickname);
		
		return "redirect:/clubDetail.go?club_idx="+club_idx;
	}
	
	// 거절 -> 딜리트
	@RequestMapping("/applyReject.do")
	public String applyReject(@RequestParam String club_idx, @RequestParam String member_idx){
		
		clubService.applyReject(club_idx, member_idx);
		
		return "redirect:/clubDetail.go?club_idx="+club_idx;
	}
	
	@RequestMapping("/clubWrite.go")
	public String clubWriteGo(Model model) {
		
		ArrayList<ClubDTO> locList = clubService.locationCode();
		model.addAttribute("location", locList);
		
		return "/club/clubWrite";
	}
	
	@RequestMapping("/clubBookPop.go")
	public String clubBookPop() {
		return "/club/clubBookPop";
	}
	
	@RequestMapping("/clubWrite.do")
	public String clubWrite(@RequestParam HashMap<String, Object> params, HttpSession session) {
		logger.info("글쓰기 정보" + params);
		int member_idx = (int)session.getAttribute("loginIdx"); 		
		params.put("loginIdx", member_idx);
		int totalPage = TrackerService.getTotalPage(params);
		params.put("totalPage",totalPage);
		params.put("member_idx", String.valueOf(member_idx));
		logger.info("글쓰기 정보" + params);
		
		ClubDTO dto = new ClubDTO();
		
		dto.setMember_idx((String)params.get("member_idx"));
		dto.setIsbn((String)params.get("isbn"));
		dto.setClub_name((String)params.get("club_name"));
		dto.setClub_content((String)params.get("club_content"));
		dto.setClub_meetdate((String)params.get("club_meetdate"));
		dto.setCode_idx((String)params.get("code_idx"));
		dto.setClub_onoff((String)params.get("club_onoff"));
		dto.setClub_num((String)params.get("club_num"));
		
		
		// 글쓰기
		clubService.clubWrite(dto);
		
		String club_idx = dto.getClub_idx();
		
		// 글쓴이 참가 리스트 넣기
		clubService.clubJoin(club_idx,member_idx);
		
		// 채팅방 생성 후 채팅생성
		chatservice.createchatroom(club_idx,member_idx);
		
		
		return "redirect:/clubDetail.go?club_idx="+club_idx;
	}
	
	@RequestMapping("/clubDelete.do")
	public String clubDelete(@RequestParam String club_idx) {
		
		ArrayList<ClubDTO> applyMember = clubService.applyMember(club_idx);
		
		// 신청자삭제 
		for (ClubDTO clubDTO : applyMember) {
			clubService.applyReject(club_idx, clubDTO.getMember_idx());			
		}
		
		// 글 지우기
		clubService.clubDelete(club_idx);
		
		// 모임 채팅 모두 나가기
		chatservice.clubchatDelete(club_idx);
		
		return "/club/clubList";
	}
	
	//	location.href='/deleteMem.do?member_idx='+member_idx+'&club_idx='+club_idx;
	@RequestMapping("/deleteMem.do")
	public String deleteMem(@RequestParam String member_idx, @RequestParam String club_idx) {
		clubService.applyReject(club_idx, member_idx);
		
		
		// 채팅방 나가기 기능 추가 필요
		chatservice.clubchatDelete(club_idx);
						
		return "redirect:/clubDetail.go?club_idx="+club_idx;
	}
	
	
	
	// 모집 종료 
	@RequestMapping("clubUpdate.do")
	public String clubUpdate(@RequestParam String club_idx) {
		ArrayList<ClubDTO> applyMember = clubService.applyMember(club_idx);
		
		for (ClubDTO clubDTO : applyMember) {
			clubService.applyReject(club_idx, clubDTO.getMember_idx());			
		}
		
		clubService.clubUpdate(club_idx);
		
		return "redirect:/clubDetail.go?club_idx="+club_idx;
	}
	
	// 채팅방을 나가면
	// 신청테이블에서 삭제 clubService.applyReject(club_idx, clubDTO.getMember_idx());
	
	
	
	@RequestMapping("/myApplyList.ajax") 
	@ResponseBody
	public HashMap<String, Object> myApplyList(@RequestParam String page, HttpSession session) {
		String member_idx = String.valueOf(session.getAttribute("loginIdx"));
		HashMap<String, Object> apply = clubService.myApplyList(page,member_idx);
		return apply; 
	}
	
	@RequestMapping("/myClubList.ajax") 
	@ResponseBody
	public HashMap<String, Object> myClubList(@RequestParam String page, HttpSession session) {
		String member_idx = String.valueOf(session.getAttribute("loginIdx"));
		HashMap<String, Object> club = clubService.myClubList(page,member_idx);
		return club; 
	}
	
	@RequestMapping("/addMember.go")
	public String addMemberGo(@RequestParam String club_idx, Model model) {
		
		model.addAttribute("idx", club_idx);
		
		return "/club/addMemberPop";
	}
	
	@RequestMapping("/addMemberList.ajax") 
	@ResponseBody
	public HashMap<String, Object> addMemberList(@RequestParam String page,HttpSession session) {
		String member_idx = String.valueOf(session.getAttribute("loginIdx"));
		HashMap<String, Object> clubs = clubService.addMemberList(page,member_idx);
		
		return clubs; 
	}
	
	@RequestMapping("/addMember.do")
	@ResponseBody
	public HashMap<String, Object> addMemberDo(@RequestParam String sel_club_idx,@RequestParam String club_idx) {
		logger.info("club_idx:"+sel_club_idx);
		
		// 해당 idx의 참여 확정자 명단 불러오기
		ArrayList<ClubDTO> member = clubService.clubMember(sel_club_idx);
		for (ClubDTO member1 : member) {
			String member_idx = member1.getMember_idx();
			int chk = clubService.clubApplyChk(club_idx, member_idx);
			
			if(chk==0) {
				clubService.clubApply(club_idx, member_idx);
				clubService.applyAccept(club_idx, member_idx);				
				// 채팅방 입장후 채팅생성				
				String member_nickname = clubService.findmembernickname(member_idx);
				chatservice.clubchatjoin(club_idx, Integer.parseInt(member_idx),member_nickname);
			}			
		}
			
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("sucess", true);
		return result;
	}
	
	@RequestMapping("/checkNum.ajax")
	@ResponseBody
	public HashMap<String, Object> checkNum(@RequestParam String sel_club_idx,@RequestParam String club_idx) {
		
		//sel_club_idx 를 이용해서 확정 인원 구해오기
		int sel_club_num = clubService.meetNum(sel_club_idx);
		
		// club_idx를 이용해서 추가 가능한 인원 구해오기 
		// 1. club_idx의 모집 입원 
		int club_num = clubService.clubNum(club_idx);
		// 1. club_idx 의 확정인원
		int meet_num = clubService.meetNum(club_idx);
		
		int need_num = club_num - meet_num;
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		logger.info("need_num : " + need_num);
		logger.info("sel_club_num : " + sel_club_num);
		
		if(need_num<sel_club_num) {
			result.put("success", false);
			result.put("msg", "모집 가능 인원보다 많습니다. ");
			
		}else {
			result.put("success", true);
		}
		
		
		return result;
	}
	
	
	
	@RequestMapping("/clubReplyList.ajax") 
	@ResponseBody
	public HashMap<String, Object> clubReplyList(@RequestParam String page,@RequestParam String club_idx) {
		HashMap<String, Object> reply = clubService.replyList(page,club_idx);
		return reply; 
	}
	
	@RequestMapping("/clubReplyWrite.ajax") 
	@ResponseBody
	public HashMap<String, Object> clubReplyWrite(@RequestParam String club_idx,@RequestParam String reply_content,HttpSession session) {
		String member_idx = String.valueOf(session.getAttribute("loginIdx")); 
		clubService.clubReplyWrite(member_idx,reply_content,club_idx);
		HashMap<String, Object> reply = new HashMap<String, Object>();
		reply.put("success", true);
		return reply; 
	}
	
	@RequestMapping("/clubReplyDelete.ajax") 
	@ResponseBody
	public HashMap<String, Object> clubReplyDelete(@RequestParam String reply_idx) {
		
		clubService.clubReplyDelete(reply_idx);
		HashMap<String, Object> reply = new HashMap<String, Object>();
		reply.put("success", true);
		return reply; 
	}
	
	
	@RequestMapping("/clubReplyUpdate.ajax") 
	@ResponseBody
	public HashMap<String, Object> clubReplyUpdate(@RequestParam String reply_idx,@RequestParam String reply_content) {
		
		clubService.clubReplyUpdate(reply_idx,reply_content);
		HashMap<String, Object> reply = new HashMap<String, Object>();
		reply.put("success", true);
		return reply; 
	}
	
	@RequestMapping("/clubReReply.ajax") 
	@ResponseBody
	public HashMap<String, Object> clubReReply(@RequestParam String reply_idx,@RequestParam String reply_content,@RequestParam String club_idx,HttpSession session) {
		
		// 대댓글 작성자
		String member_idx = String.valueOf(session.getAttribute("loginIdx")); 
		
		clubService.clubReReply(member_idx,reply_idx,reply_content);
		
		String clubTitle = clubService.clubTitle(club_idx);
		// 원댓 작성자
		String replyMemberIdx = clubService.replyMember(reply_idx);
		
		logger.info("replyMemberIdx : " + replyMemberIdx);
		logger.info("member_idx : " + member_idx);
		
		if (!replyMemberIdx.equals(member_idx)) {
			clubService.reReplyAlarm(replyMemberIdx,club_idx,clubTitle);
		}		
		//clubService.reReplyAlarm(replyMemberIdx,club_idx,clubTitle);
		
		HashMap<String, Object> reply = new HashMap<String, Object>();
		reply.put("success", true);
		return reply; 
	}
	
	@RequestMapping("/reReplyList.ajax") 
	@ResponseBody
	public HashMap<String, Object> reReplyList(@RequestParam String reply_idx) {
		HashMap<String, Object> reReply = clubService.reReplyList(reply_idx);
		return reReply; 
	}
	
	@RequestMapping("/nicknameList.ajax") 
	@ResponseBody
	public HashMap<String, Object> nicknameList(@RequestParam String club_idx) {
		ArrayList<ClubDTO> nicknameList = clubService.nicknameList(club_idx);
		String nickname = "";
		for (ClubDTO clubDTO : nicknameList) {
			nickname += clubDTO.getMember_nickname()+" ";
		}
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("nickname", nickname);
		return data; 
	}
}
