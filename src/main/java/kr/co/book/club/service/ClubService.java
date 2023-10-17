package kr.co.book.club.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.club.dao.ClubDAO;
import kr.co.book.club.dto.ClubDTO;

@Service
@MapperScan(value= {"kr.co.book.club.dao"})
public class ClubService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ClubDAO clubDAO;
	
	
	public HashMap<String, Object> clubList(String sPage, String searchText) {
		HashMap<String, Object> clubs = new HashMap<String, Object>();	
		ArrayList<ClubDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 5*(page-1);
		int total = 0;
		
		if (searchText.equals("default")) {
			total = clubDAO.totalClubList();
			list = clubDAO.clubList(offset);
		}else {
			total = clubDAO.totalClubListSearch(searchText);
			list = clubDAO.clubListSearch(offset,searchText);
		}
		
		
		int range = total%5  == 0 ? total/5 : total/5+1;
		page = page>range ? range:page;
		clubs.put("offset", offset);
		clubs.put("list", list);
		clubs.put("currPage", page);
		clubs.put("pages", range);
		
		return clubs;
	}


	public ClubDTO clubDetail(String club_idx) {
		return clubDAO.clubDetail(club_idx);
	}


	public ArrayList<ClubDTO> clubMember(String club_idx) {
		return clubDAO.clubMember(club_idx);
	}

	public int clubApplyChk(String club_idx, String member_idx) {
		return clubDAO.clubApplyChk(club_idx,member_idx);
	}
	
	public void clubApply(String club_idx, String member_idx) {
		clubDAO.clubApply(club_idx,member_idx);
		
	}


	public ArrayList<ClubDTO> applyMember(String club_idx) {
		return clubDAO.applyMember(club_idx);
	}


	public void applyAccept(String club_idx, String member_idx) {
		clubDAO.applyAccept(club_idx,member_idx);
		
	}


	public void applyReject(String club_idx, String member_idx) {
		clubDAO.applyReject(club_idx,member_idx);
	}


	public ArrayList<ClubDTO> locationCode() {
		return clubDAO.locationCode();
	}


	public void clubWrite(ClubDTO dto) {
		clubDAO.clubWrite(dto);
	}


	public void clubJoin(String club_idx, int member_idx) {
		clubDAO.clubJoin(club_idx,member_idx);
	}


	public void clubDelete(String club_idx) {
		clubDAO.clubDelete(club_idx);		
	}


	public void clubUpdate(String club_idx) {
		clubDAO.clubUpdate(club_idx);
	}


	public HashMap<String, Object> myApplyList(String sPage, String member_idx) {
		
		HashMap<String, Object> apply = new HashMap<String, Object>();	
		ArrayList<ClubDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 5*(page-1);
		int total = 0;
		
		
		total = clubDAO.totalMyApplyList(member_idx);
		list = clubDAO.myApplyList(member_idx,offset);
		
		
		
		int range = total%5  == 0 ? total/5 : total/5+1;
		page = page>range ? range:page;
		apply.put("offset", offset);
		apply.put("list", list);
		apply.put("currPage", page);
		apply.put("pages", range);
		
		return apply;
	}


	public HashMap<String, Object> myClubList(String sPage, String member_idx) {
		
		HashMap<String, Object> club = new HashMap<String, Object>();	
		ArrayList<ClubDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 5*(page-1);
		int total = 0;
		
		
		total = clubDAO.totalMyClubList(member_idx);
		list = clubDAO.myClubList(member_idx,offset);
		for (ClubDTO clubDTO : list) {
			clubDTO.setMeet_num(String.valueOf(clubDAO.meetNum(clubDTO.getClub_idx())));
		}
		
		
		
		
		int range = total%5  == 0 ? total/5 : total/5+1;
		page = page>range ? range:page;
		club.put("offset", offset);
		club.put("list", list);
		club.put("currPage", page);
		club.put("pages", range);
		
		return club;
	}


	public HashMap<String, Object> addMemberList(String sPage,String member_idx) {
		HashMap<String, Object> clubs = new HashMap<String, Object>();	
		ArrayList<ClubDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 5*(page-1);
		int total = 0;
		
		total = clubDAO.totalAddMemberList(member_idx);
		list = clubDAO.addMemberList(member_idx,offset);		
		int range = total%5  == 0 ? total/5 : total/5+1;
		page = page>range ? range:page;
		clubs.put("offset", offset);
		clubs.put("list", list);
		clubs.put("currPage", page);
		clubs.put("pages", range);
		
		return clubs;
	}


	public int clubNum(String club_idx) {
		return clubDAO.clubNum(club_idx);
	}


	public int meetNum(String club_idx) {
		return clubDAO.meetNum(club_idx);
		
	}


	public HashMap<String, Object> replyList(String sPage, String club_idx) {
		HashMap<String, Object> reply = new HashMap<String, Object>();	
		ArrayList<ClubDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 10*(page-1);
		int total = 0;
		
		
		total = clubDAO.totalReplyList(club_idx);
		logger.info("total list : "+total);
		list = clubDAO.clubReplyList(club_idx,offset);
		logger.info(" list : "+list);
		
		int range = total%10  == 0 ? total/10 : total/10+1;
		page = page>range ? range:page;
		reply.put("offset", offset);
		reply.put("list", list);
		reply.put("currPage", page);
		reply.put("pages", range);
		
		return reply;
	}


	public void clubReplyWrite(String member_idx, String reply_content, String club_idx) {
		clubDAO.clubReplyWrite(member_idx,reply_content,club_idx);
		
	}


	public void clubReplyDelete(String reply_idx) {
		clubDAO.clubReplyDelete(reply_idx);
	}


	public void clubReplyUpdate(String reply_idx, String reply_content) {
		clubDAO.clubReplyUpdate(reply_idx,reply_content);		
	}


	public void clubReReply(String member_idx, String reply_idx, String reply_content) {
		clubDAO.clubReReply(member_idx,reply_idx,reply_content);
		
	}


	public HashMap<String, Object> reReplyList(String reply_idx) {
		HashMap<String, Object> reply = new HashMap<String, Object>();	
		ArrayList<ClubDTO> list = null;
		
		list = clubDAO.reReplyList(reply_idx);
		logger.info(" list : "+list);
		reply.put("list", list);
		return reply;
	}


	public ArrayList<ClubDTO> nicknameList(String club_idx) {
		// TODO Auto-generated method stub
		return clubDAO.nicknameList(club_idx);
	}


	public String replyMember(String reply_idx) {
		return clubDAO.replyMember(reply_idx);
	}


	public String clubTitle(String club_idx) {
		return clubDAO.clubTitle(club_idx);
	}


	public void reReplyAlarm(String member_idx, String idx, String clubTitle) {
		String content = "["+clubTitle+"] 댓글에 답댓글이 달렸습니다.";
		clubDAO.reReplyAlarm(member_idx,idx,content);
	}


	public String clubWriter(String club_idx) {
		return clubDAO.clubWriter(club_idx);
	}


	public void applyAlarm(String club_idx, String writer_idx, String clubTitle) {
		String content = "["+clubTitle+"] 신청자가 있습니다. ";
		clubDAO.applyAlarm(writer_idx,club_idx,content);
		
	}

	// 닉네임 가져오기
	public String findmembernickname(String member_idx) {
		return clubDAO.findmembernickname(member_idx);
	}


	
	


}
