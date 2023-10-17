package kr.co.book.club.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.club.dto.ClubDTO;

@Mapper
public interface ClubDAO {

	int totalClubList();

	ArrayList<ClubDTO> clubList(int offset);

	int totalClubListSearch(String searchText);

	ArrayList<ClubDTO> clubListSearch(int offset, String searchText);

	ClubDTO clubDetail(String club_idx);

	ArrayList<ClubDTO> clubMember(String club_idx);
	
	int clubApplyChk(String club_idx, String member_idx);
	
	void clubApply(String club_idx, String member_idx);

	ArrayList<ClubDTO> applyMember(String club_idx);

	void applyAccept(String club_idx, String member_idx);

	void applyReject(String club_idx, String member_idx);

	ArrayList<ClubDTO> locationCode();

	void clubWrite(ClubDTO dto);

	void clubJoin(String club_idx, int member_idx);

	void clubDelete(String club_idx);

	void clubUpdate(String club_idx);

	int totalMyApplyList(String member_idx);

	ArrayList<ClubDTO> myApplyList(String member_idx, int offset);

	int totalMyClubList(String member_idx);

	ArrayList<ClubDTO> myClubList(String member_idx, int offset);

	int totalAddMemberList(String member_idx);

	ArrayList<ClubDTO> addMemberList(String member_idx,int offset);

	int clubNum(String club_idx);

	int meetNum(String club_idx);

	int totalReplyList(String club_idx);

	ArrayList<ClubDTO> clubReplyList(String club_idx, int offset);

	void clubReplyWrite(String member_idx, String reply_content, String club_idx);

	void clubReplyDelete(String reply_idx);

	void clubReplyUpdate(String reply_idx, String reply_content);

	void clubReReply(String member_idx, String reply_idx, String reply_content);

	ArrayList<ClubDTO> reReplyList(String reply_idx);

	ArrayList<ClubDTO> nicknameList(String club_idx);

	String replyMember(String reply_idx);

	String clubTitle(String club_idx);

	void reReplyAlarm(String member_idx, String idx, String content);

	String clubWriter(String club_idx);

	void applyAlarm(String writer_idx, String club_idx, String content);

	String findmembernickname(String member_idx);

	



}
