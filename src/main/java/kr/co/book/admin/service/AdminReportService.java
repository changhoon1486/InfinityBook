package kr.co.book.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.admin.dao.AdminReportDAO;
import kr.co.book.chat.service.ChatService;
import kr.co.book.club.service.ClubService;

@Service
@MapperScan(value = {"kr.co.book.admin.dao"}) 
public class AdminReportService {
	
	@Autowired AdminReportDAO adminReportDAO;
	@Autowired ChatService chatservice;

	Logger logger = LoggerFactory.getLogger(getClass());

	public HashMap<String, Object> reportSend(HashMap<String, Object> params) {
		
		int row = adminReportDAO.reportSend(params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", row);
		
		return map;
	}

	public HashMap<String, Object> reportList(HashMap<String, Object> params) {
		logger.info("params : "+params);
		HashMap<String, Object> map = new HashMap<String, Object>();	
		ArrayList<HashMap<String, Object>> list = null;
		int page = Integer.parseInt(String.valueOf(params.get("page"))); 
		int offset = 10*(page-1);
		params.put("offset", offset);
		int total = 0;
		
		list = adminReportDAO.reportList(params);
		logger.info("list : "+list);
		total = list.size();
		logger.info("total : "+total);		
			
		int range = total%10  == 0 ? total/10 : total/10+1;
		page = page>range ? range:page;
		
		map.put("offset", offset);
		map.put("list", list);
		map.put("currPage", page);
		map.put("pages", range);
		return map;
	}

	public ModelAndView getReportInfor(HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("/admin/adminReportDetail");
		
		HashMap<String, Object> map = adminReportDAO.getReportInfor(params);
		mav.addObject("info", map);
		
		return mav;
	}

	public HashMap<String, Object> reportRecordList(HashMap<String, Object> params) {
		logger.info("params : "+params);
		HashMap<String, Object> map = new HashMap<String, Object>();	
		ArrayList<HashMap<String, Object>> list = null;
		int page = Integer.parseInt(String.valueOf(params.get("page"))); 
		int offset = 5*(page-1);
		params.put("offset", offset);
		int total = 0;
		
		list = adminReportDAO.reportRecordList(params);
		logger.info("list : "+list);
		total = list.size();
		logger.info("total : "+total);		
			
		int range = total%5  == 0 ? total/5 : total/5+1;
		page = page>range ? range:page;
		
		map.put("offset", offset);
		map.put("list", list);
		map.put("currPage", page);
		map.put("pages", range);
		
		return map;
	}

	public HashMap<String, Object> reportHandling(HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int blind = Integer.parseInt((String) params.get("blind"));
		String memberState = (String) params.get("memberState");
		int code_idx = Integer.parseInt((String) params.get("code_idx"));
		String target = (String) params.get("target");
		String alarmContent = "";
		String result = "";

		if(blind == 1) {
			
			if(adminReportDAO.blind(params) == 1) {
				switch (code_idx) {
				case 69:
					alarmContent = "신고처리로 ["+target+"] 감상문이 삭제되었습니다.";
					break;
				case 70:
					alarmContent = "신고처리로 ["+target+"] 모임이 삭제되었습니다.";
					chatservice.clubchatDelete((String) params.get("idx"));
					break;
				case 71:
					alarmContent = "신고처리로 ["+target+"] 댓글이 삭제되었습니다.";
					break;
				case 72:
					alarmContent = "신고처리로 ["+target+"] 리뷰가 삭제되었습니다.";
					break;
				case 73:
					alarmContent = "신고처리로 ["+target+"] 도서가 삭제되었습니다.";
					break;
				}
				params.put("alarmContent", alarmContent);
				adminReportDAO.blindAlarm(params);
				result += "블라인드 처리";		
				
				adminReportDAO.updateMemberState(params);
				result += " / "+memberState;
			}			
			
		} else{
			adminReportDAO.blind(params);
			result += "	공개";
			
			adminReportDAO.updateMemberState(params);
			result += " / "+ memberState;
		}
		
		params.put("result", result);
		int row = 0;
		if(adminReportDAO.reportHandlingCompleted(params) == 1) {
			row = adminReportDAO.reportHandlingRecord(params);
		}
		map.put("success", row);
		
		return map;
	}

	
	
	
	
	
	
	
	
	
}
