package kr.co.book.transaction.service;



import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.book.transaction.dao.ChangeDAO;
import kr.co.book.transaction.dao.RentDAO;
import kr.co.book.transaction.dto.RentDTO;

@Service
@MapperScan(value={"kr.co.book.transaction.dao"})
public class RentService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired RentDAO dao;
	
	// 대여 신청
	@Transactional
	public void rentapply(HashMap<String, Object> params) {
		
		// 대여 신청
		dao.rentapply(params);
		
		// 대여 IDX
		String idx = dao.findrent_idx(params);
		
		// 대여신청한 책에 대한 정보(회원 idx, 책 이름) 들고오기
		RentDTO dto = dao.findchbmidx(params);
		
		// 대화방 만들기
		int code = 3;		
		params.put("code_idx", code);
		params.put("idx", idx);		
		dao.createchatroom(params);
		// 신청한 책 정보 넣기
		params.put("library", dto);
		// 신청내역 대화방에 뿌려주기
		dao.applychatcontent(params);
		
		// member_idx 상대방 값으로 변경후
		params.put("member_idx",dto.getMember_idx());						
		// 상대방 대화방 만들기
		dao.createchatroom(params);		

		
	}
	
	// 처음 대여 신청 정보
	public HashMap<String, Object> rentreservation(String idx) {

		// 처음 대여 신청정보
		return dao.rentreservation(idx);
	}
	
	// 대여 약속 잡기 
	@Transactional
	public void rentreservation(@RequestParam HashMap<String, Object> params) {
		
		// 대여 약속 잡기
		dao.updaterent(params);		
		// 대여 책 들고오기
		RentDTO dto = dao.findchbmidx(params);
		// 책 정보 넣기
		params.put("library", dto);
		// 코드 넣기
		int code = 3;		
		params.put("code_idx", code);
		// 대여 약속 정보 채팅으로 뿌려주기
		dao.chatrentreservation(params);		
		
	}

	// 대여 완료 시 
	@Transactional
	public void rentend(HashMap<String, Object> params) {
		
		// 상태 변경
		dao.rentend(params);
		
		// 보증금 들고오기
		int deposit = dao.rentenddeposit(params);
		
		params.put("deposit", deposit);
		// 보증금 돌려주기
		dao.rentendreturn(params);
		
		String library_idx = params.get("library").toString();
		// 책상태 되돌리기
		dao.chglibrary(library_idx);
		
		
	}

	
}
