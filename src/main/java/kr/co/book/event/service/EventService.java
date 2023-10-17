package kr.co.book.event.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.book.event.dao.EventDAO;
import kr.co.book.event.dto.EventDTO;
import kr.co.book.notice.dto.NoticeDTO;

@Service
@MapperScan(value={"kr.co.book.event.dao"})
public class EventService {
	
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired EventDAO dao;
	
	@Value("${spring.servlet.multipart.location}") private String root;
	
	@Transactional
	public int eventWrite(MultipartFile photo, HashMap<String, String> params) {
		
		EventDTO dto = new EventDTO();
		
		int event_no = 0;
		
		logger.info("서비스 도착");
		dto.setMember_idx(params.get("member_idx"));                                
		dto.setEvent_title(params.get("event_title"));
		dto.setEvent_content(params.get("event_content"));
		dto.setEvent_cnt(Integer.parseInt(params.get("event_cnt")));		
		String eventStartDateStr = params.get("event_startdate");
		String eventEndDateStr = params.get("event_enddate");

		SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		try {
		    Date eventStartDate = new Date(inputDateFormat.parse(eventStartDateStr).getTime());
		    Date eventEndDate = new Date(inputDateFormat.parse(eventEndDateStr).getTime());

		    dto.setEvent_startdate(eventStartDate);
		    dto.setEvent_enddate(eventEndDate);
		} catch (Exception e) {
		    // 예외 처리
		}
		
		int success = dao.eventWrite(dto);
		if (success > 0) {
			event_no = dao.event_No_Search(dto);
		}
		
		logger.info("success: " + success);
		
		if (success > 0) {
			if (photo != null && !photo.getOriginalFilename().equals("")) {
				// 입력받은 파일 이름
	          String ori_photo_name = photo.getOriginalFilename();
	          
	          // 확장자를 추출하기 위한 과정
	          String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
	          // 새로운 파일 이름은?
	          String new_photo_name = System.currentTimeMillis() + ext;
	          logger.info("파일 업로드 : " + ori_photo_name + "=>" + new_photo_name + "으로 변경될 예정");
	          String member_idx = params.get("member_idx");
	          try {
	             byte[] bytes = photo.getBytes();
	             Path path = Paths.get(root+"/"+new_photo_name);
	             Files.write(path, bytes);
	             dao.event_FileSave(85, event_no, ori_photo_name, new_photo_name,member_idx,0);
	          }catch (Exception e) {
	        	  e.printStackTrace();
	          }
	          
			}	
			
		}
		;
		
		return success;
		
		}
	public HashMap<String, Object> eventlist(int page) {
		
		ArrayList<EventDTO> list = null;		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int offset = 0;
		int total = 0;
		int range = 0;
		offset = 10*(page - 1);		
		total =dao.totalEventCount();
		range = total%10  == 0 ? total/10 : (total/10)+1;	
		page = page>range ? range:page;
		list = dao.eventList(offset);
		
		map.put("offset", offset);
		map.put("list", list);
		// 현재 페이지
		map.put("currPage", page);
		// 총 페이지 수
		map.put("pages", range);
		
		
		return map;
	}

	

}
