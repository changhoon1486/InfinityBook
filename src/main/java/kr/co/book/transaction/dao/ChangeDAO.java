package kr.co.book.transaction.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.transaction.dto.ChangeDTO;

@Mapper
public interface ChangeDAO {

	// 교환 신청
	void changeapply(HashMap<String, Object> params);

	// 교환 IDX
	String findchange_idx(HashMap<String, Object> params);

	// 대화방 만들기
	void createchatroom(HashMap<String, Object> params);
	
	// 신청내역 대화방에 뿌려주기
	void applychatcontent(HashMap<String, Object> params);

	// 책에 대한 정보 들고오기
	ChangeDTO findchbmidx(HashMap<String, Object> params);
	
	// 책에 대한 정보 들고오기2
	ChangeDTO findchbmidx2(HashMap<String, Object> params);

	// 처음 교환 신청정보
	HashMap<String, Object> chgreservation(String idx);

	// 교환 약속 잡기
	void updatechange(HashMap<String, Object> params);

	// 교환 약속정보 메세지 보내기
	void chatchangereservation(HashMap<String, Object> params);

	


	
	
	
	



}
