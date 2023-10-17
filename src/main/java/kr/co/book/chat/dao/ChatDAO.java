package kr.co.book.chat.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.chat.dto.ChatDTO;


@Mapper
public interface ChatDAO {

	// 대화중인 대화 방 
	ArrayList<ChatDTO> message_list(ChatDTO dto);

	// 교환 신청한 책 IDX
	String chgbookidx(String idx);
	
	// 교환 신청한 유저 IDX
	String chgapplyuser(String idx);

	// 대여 신청한 책 IDX
	String rentbookidx(String idx);

	// 대여 신청한 유저 IDX
	String rentapplyuser(String idx);

	// 대화 내역
	ArrayList<ChatDTO> room_content_list(ChatDTO dto);

	// 채팅방 상대방 IDX 가져오기
	ArrayList<HashMap<String, Integer>> chatuserIDX(String cODE_IDX, String room);
	
	// 전송 메세지 저장
	void messageSendInlist(String cODE_IDX, String room, int chat_sender, String content);

	// 전송 사진 저장
	void fileWrite(String string, String string2, String string3, String oriPhotoname, String serPhotoname);

	// 대화 방의 책
	HashMap<String, Object> message_librarydetail(String library);

	// 대화 방의 책 상태
	Object librarystate(String library);

	// 다른사람과 교환 상태
	int otherchangeck(String room);
	
	// 나랑 교환 상태
	Object changestate(String room);

	// 다른사람과 대여 상태
	int otherrentck(String room);

	// 나랑 대여 상태
	Object rentstate(String room);

	// 교환 예약 수락
	void finalchangeok(String room, String member_idx);

	// 들고있는 보증금 들고오기
	int userdeposit(String member_idx);

	// 예약 걸린 보증금 들고오기
	int rentdeposit(String room);

	// 대여 보증금 사용
	void usedeposit(String member_idx, int rentdeposit, String room);

	// 대여 예약 수락
	void finalrentok(String room, String member_idx);

	// 대여 책 상태 변경	
	void finalbookok(String library);

	// 교환 예약 취소
	int changereservationno(String room, String member_idx);
	
	// 대여 예약 취소
	int rentreservationno(String room, String member_idx);

	// 책 상태 되돌리기
	void finalbookno(String library);

	// 현재 교환상태 확인
	int chkchgroomstate(String room);

	// 현재 대여상태 확인
	int chkrentroomstate(String room);

	// 대화방 나가기
	int chatout(String cODE_IDX, String room, String member_idx);

	// 모임 생성시 모임 메세지방 생성
	void createchatroom(String club_idx, int member_idx);

	// 모임 채팅방 생성 됐다는 메세지
	void createchat(String club_idx, int member_idx, String string);
	
	// 모임 참여자에게 메세지 전송
	void sendclubmembermessage(String club_idx, int member_idx, String string2);

	// 모임 채팅 모두 나가기
	void clubchatDelete(int i, String club_idx);

	String findclub_name(String idx);

	String findchgbooktitle(String library_idx);

	String findchgbookcover(String library_idx);

	HashMap<String, Object> club_detail(HashMap<String, Object> params);

	String findbookuser(String library_idx);

	Object bookreviewchk(String code_idx, String room, String member_idx);

	Object userreviewchk(String code_idx, String room, String member_idx);






	


	
}
