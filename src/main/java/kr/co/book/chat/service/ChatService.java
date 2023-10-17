package kr.co.book.chat.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.book.chat.dao.ChatDAO;
import kr.co.book.chat.dto.ChatDTO;

@Service
@MapperScan(value={"kr.co.book.chat.dao"})
public class ChatService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ChatDAO dao;
	
	@Value("${spring.servlet.multipart.location}") private String root;
	
	// 대화중인 대화 방
	public ArrayList<ChatDTO> messageList(ChatDTO dto) {
		String member_idx = dto.getMember_idx();
		logger.info("서비스 시작");
		// 메세지 리스트에 나타낼 것들 가져오기 - 가장 최근 메세지, 보낸사람 profile 사진, 보낸사람 nick
		ArrayList<ChatDTO> list = dao.message_list(dto);
		
		for (ChatDTO cto : list) {	
			cto.setMember_idx(member_idx);
			
			// 현재 채팅방의 책idx를 가져온다.
			int codeidx = Integer.parseInt(cto.getCode_idx());
			String idx = cto.getIdx();
						
			// 교환일 경우
			if(codeidx == 2) {
				// 교환 신청한 책 IDX
				cto.setLibrary_idx(dao.chgbookidx(idx));
				cto.setLibrary_title(dao.findchgbooktitle(cto.getLibrary_idx()));
				cto.setLibrary_cover(dao.findchgbookcover(cto.getLibrary_idx()));
				
				// 교환 신청한 유저 IDX
				cto.setApplyuser(dao.chgapplyuser(idx));
				// 상대방 세팅
				if(member_idx.equals(cto.getApplyuser())) {
					cto.setOther(dao.findbookuser(cto.getLibrary_idx()));
				} else {
					cto.setOther(cto.getApplyuser());
				}
				
				
			// 대여일 경우
			}else if (codeidx ==3) {
				// 대여 신청한 책 IDX
				cto.setLibrary_idx(dao.rentbookidx(idx));
				cto.setLibrary_title(dao.findchgbooktitle(cto.getLibrary_idx()));
				cto.setLibrary_cover(dao.findchgbookcover(cto.getLibrary_idx()));
				
				// 대여 신청한 유저 IDX
				cto.setApplyuser(dao.rentapplyuser(idx));
				// 상대방 세팅
				if(member_idx.equals(cto.getApplyuser())) {
					cto.setOther(dao.findbookuser(cto.getLibrary_idx()));
				} else {
					cto.setOther(cto.getApplyuser());
				}
				
				
			// 모임일 경우
			}else if(codeidx == 4) {
				cto.setClub_name(dao.findclub_name(idx));
			}
			

		}

		return list;
	}
	
	// 대화 내역
	@Transactional
	public ArrayList<ChatDTO> roomContentList(ChatDTO dto) {

		// 대화 내역
		ArrayList<ChatDTO> clist = dao.room_content_list(dto);
				
		return clist;
	}
	
	// 전송 메세지 저장
	@Transactional
	public void messageSendInlist(String code_idx, String room, int chat_sender, String content) {
		
		dao.messageSendInlist(code_idx, room, chat_sender, content);

	}
	
	// 전송 사진 저장
	@Transactional
	public String chatphoto(HashMap<String, String> params, MultipartFile photo, HttpSession session) {
		
		// 사진 정보 
		String oriPhotoname = photo.getOriginalFilename();
		String ext = oriPhotoname.substring(oriPhotoname.lastIndexOf("."));
		String serPhotoname = System.currentTimeMillis()+ext;
		logger.info(oriPhotoname+"->"+serPhotoname);

		// 전송자 IDX
		String sender = session.getAttribute("loginIdx").toString();
		int chat_sender = Integer.parseInt(sender);
		
		// 사진 전송
		dao.messageSendInlist(params.get("code_idx"), params.get("idx"), chat_sender,  "/upload/"+serPhotoname);

						
		// 사진 저장
		try {
			byte[] bytes = photo.getBytes();
			Path path = Paths.get(root+"/"+serPhotoname);
			Files.write(path, bytes);
			
			logger.info(serPhotoname+" save OK");
			dao.fileWrite(params.get("code_idx"), params.get("idx"),session.getAttribute("loginIdx").toString(),oriPhotoname, serPhotoname);
			logger.info("사진 저장 완료");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String photoroot = "/upload/"+serPhotoname;
		
		return photoroot;
	}
	
	// 대화 방의 책
	public HashMap<String, Object> message_librarydetail(String library) {
		
		return dao.message_librarydetail(library);
	}
	
	// 모임 정보 가져오기
	public HashMap<String, Object> message_clubdetail(HashMap<String, Object> params) {
			
		// 모임 isbn, 모임 명 들고오기
		HashMap<String, Object> map = dao.club_detail(params);
		
				
		return map;
	}
	
	// 대화 방의 책 상태
	public HashMap<String, Object> total_stateajax(String code_idx, String room, String member_idx, String library) {
		
		logger.info(code_idx,room,member_idx,library);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bookreview", dao.bookreviewchk(code_idx,room,member_idx));
		map.put("userreview", dao.userreviewchk(code_idx,room,member_idx));
		// 대화 방의 책 상태
		map.put("librarystate", dao.librarystate(library));
		
		// 교환신청 or 대여신청 상태여부
		if(Integer.parseInt(code_idx) == 2) {		
			
			// 다른사람과 교환 상태
			int chgck = dao.otherchangeck(room);
			map.put("chgck", chgck);
			
			// 나랑 교환상태
			map.put("changestate", dao.changestate(room));
			
		}else if(Integer.parseInt(code_idx) == 3) {
			
			// 다른사람과 대여 상태
			int rentck = dao.otherrentck(room);
			map.put("rentck", rentck);
			
			// 나랑 대여상태
			map.put("rentstate", dao.rentstate(room));
			
		}
		
		
		return map;
	}
	
	// 약속 수락
	@Transactional
	public int reservationok_ajax(String code_idx, String room, String library, String member_idx) {
		
		int success = 0;
		// 수락이 교환인지 대여인지
		// 교환일시				
		if(Integer.parseInt(code_idx) == 2) {
			
			// 교환 예약 수락
			dao.finalchangeok(room,member_idx);
			success = 2;
						
		}else if(Integer.parseInt(code_idx) == 3) {
						
			// 들고있는 보증금 들고오기
			int deposit = dao.userdeposit(member_idx);
						
			// 예약 걸린 보증금 들고오기
			int rentdeposit = dao.rentdeposit(room);			
			success = 1;
			
			int don = rentdeposit* -1;
			// 내가 들고있는 보증금이 걸린 보증금보다 크다면
			if(deposit >= rentdeposit) {
				
				// 대여 보증금 사용
				dao.usedeposit(member_idx, don,room);
				
				// 대여 예약 수락
				dao.finalrentok(room,member_idx);
				
				// 대여 책 상태 변경
				dao.finalbookok(library);
				
				success = 2;
			}
		
		}
				
		return success;
	}
	
	// 약속 거절
	public int reservationno_ajax(String code_idx, String room, String library, String member_idx) {
		
		int success = 0;
				
		if(Integer.parseInt(code_idx) == 2) {
			// 교환 일시 들어옴
			// 교환 예약 취소
			success = dao.changereservationno(room,member_idx);
			
			
		}else if(Integer.parseInt(code_idx) == 3) {
			// 대여 일시 들어옴
			// 대여 예약 취소
			success = dao.rentreservationno(room,member_idx);
			
			// 책 상태 되돌리기
			dao.finalbookno(library);
			
		}
		
		return success;
	}
	
	// 채팅 나가기
	public int chatout_ajax(String code_idx, String room, String apply_user, String library, String member_idx) {

		int success = 0;
		int state = 0;
		
		// 나가기전 해당 대화방에서 예약중인지 대여중인지를 확인		
		if(Integer.parseInt(code_idx) == 2) {
			// 현재 대화방이 교환이면
			// 현재 교환상태 확인
			 state = dao.chkchgroomstate(room);		
			 
		}else if(Integer.parseInt(code_idx) == 3) {
			// 현재 대화방이 대여이면
			// 현재 대여상태 확인
			state = dao.chkrentroomstate(room);			
		}else if(Integer.parseInt(code_idx) == 4) {
			// 모임 방이라면 
			state = 4;
		}
		
			// 현재 수락대기,예약중,대여중
			if(state == 1) {
				// 수락대기 상태라면
				success = 1;
			}else if(state == 2) {
				// 예약중이라면
				success = 2;
			}else if(state == 3) {
				// 대여중이라면
				success = 3;
			}else {
				// 대화방 나가기
				success = dao.chatout(code_idx,room,member_idx);
				success = 4;
			}

		return success;
	}

	// 모임 생성시 메세지방 생성
	@Transactional
	public void createchatroom(String club_idx, int member_idx) {
		
		// 모임 메세지방 생성
		dao.createchatroom(club_idx,member_idx);
		// 모임 채팅방 생성 됐다는 메세지
		dao.createchat(club_idx,member_idx,"모임 채팅방이 생성되었습니다.");
		
	}

	// 모임 참여시 메세지방 생성
	@Transactional
	public void clubchatjoin(String club_idx, int member_idx, String member_nickname) {
		
		// 모임 메세지방 가입
		dao.createchatroom(club_idx,member_idx);	
		// 모임 참여자에게 메세지 전송
		dao.sendclubmembermessage(club_idx,member_idx,member_nickname+"님이 참여하셨습니다.");

	}
	
	// 모임 채팅 모두 나가기
	public void clubchatDelete(String club_idx) {
		
		// 모임 채팅 모두 나가기
		dao.clubchatDelete(4,club_idx);
				
	}




	
	
}