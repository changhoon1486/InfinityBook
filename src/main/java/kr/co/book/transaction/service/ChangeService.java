package kr.co.book.transaction.service;

import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.book.transaction.dao.ChangeDAO;
import kr.co.book.transaction.dto.ChangeDTO;

@Service
@MapperScan(value={"kr.co.book.transaction.dao"})
public class ChangeService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ChangeDAO dao;
	
	// 교환 신청 시
	@Transactional
	public void changeapply(HashMap<String, Object> params) {
			
		// 교환신청
		dao.changeapply(params);
		
		// 교환 IDX
		String idx = dao.findchange_idx(params);
		
		// 교환신청 책에 대한 정보(회원 idx, 책이름) 들고오기
		ChangeDTO dto = dao.findchbmidx(params);

		ChangeDTO cdto = dao.findchbmidx2(params);
		
		// 대화방 만들기	
		int code = 2;
		params.put("code_idx", code);
		params.put("idx", idx);
		dao.createchatroom(params);
		// 신청한 책 정보 넣기
		params.put("library", dto);
		params.put("library2", cdto);
		// 신청내역 대화방에 뿌려주기
		dao.applychatcontent(params);

		// member_idx 상대방 값으로 변경후
		params.put("member_idx",dto.getMember_idx());				
		// 채팅방(신청받은자) 만들기		
		dao.createchatroom(params);
		
		
						
	}
	
	// 처음 교환 신청 정보
	public HashMap<String, Object> chgreservation(String idx) {
		
		// 교환 처음신청 정보 가져오기
		return dao.chgreservation(idx);
	}
	
	// 교환 약속 잡기
	@Transactional
	public void changereservation(HashMap<String, Object> params) {

		// 교환 약속 정보로 업데이트 후 
		dao.updatechange(params);		
		// 교환 책정보 가져오기
		// 교환신청 책에 대한 정보(회원 idx, 책이름) 들고오기
		ChangeDTO dto = dao.findchbmidx(params);
		ChangeDTO cdto = dao.findchbmidx2(params);
			
		// 코드 넣기
		int code = 2;		
		params.put("code_idx", code);
		// 책 정보 넣기
		params.put("library", dto);
		params.put("library2", cdto);
		
		// 교환 약속정보 메세지 보내기
		dao.chatchangereservation(params);
		
	}
	
}
