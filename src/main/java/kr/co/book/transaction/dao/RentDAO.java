package kr.co.book.transaction.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.transaction.dto.RentDTO;

@Mapper
public interface RentDAO {
	
	// 대여 신청
	void rentapply(HashMap<String, Object> params);

	// 대여 IDX
	String findrent_idx(HashMap<String, Object> params);

	// 대화방 만들기
	void createchatroom(HashMap<String, Object> params);
	
	// 신청내역 대화방에 뿌려주기
	void applychatcontent(HashMap<String, Object> params);

	// 대여신청 책에 대한 정보(회원 idx, 책이름) 들고오기
	RentDTO findchbmidx(HashMap<String, Object> params);

	// 처음 대여 신청정보
	HashMap<String, Object> rentreservation(String idx);

	// 대여 약속 잡기
	void updaterent(HashMap<String, Object> params);

	// 대여 약속정보 메세지 보내기
	void chatrentreservation(HashMap<String, Object> params);

	// 상태 변경
	void rentend(HashMap<String, Object> params);

	// 보증금 들고오기
	int rentenddeposit(HashMap<String, Object> params);

	// 보증금 돌려주기
	void rentendreturn(HashMap<String, Object> params);

	// 책 상태 돌리기
	void chglibrary(String library_idx);



}
