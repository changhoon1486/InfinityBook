package kr.co.book.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.book.admin.dao.AdminInquiryDAO;
import kr.co.book.admin.dto.AdminInquiryDTO;
import kr.co.book.mypage.dto.MyInquriyDTO;

@Service
@MapperScan(value={"kr.co.book.admin.dao"})
public class AdminInquiryService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminInquiryDAO dao;

	// 문의 상세보기
	public AdminInquiryDTO inquirydetail(String inquiry_idx) {

		return dao.inquirydetail(inquiry_idx);
	}

	// 문의 답변달기
	@Transactional
	public void inquiryreplywrite(HashMap<String, Object> params) {
		
		// 답변 달고
		dao.inquiryreplywrite(params);
		
		// 상태 변경
		dao.inquirystateupdate(params);
		
		// 알림 보내고
		String inq_title = params.get("inq_title").toString();
		String content = "["+inq_title+"] 문의에 답변이 달렸습니다.";
		params.put("content", content);
		dao.inquiryalarm(params);
		
	}
	
	// 문의 리스트
	public HashMap<String, Object> inquiryList(HashMap<String, Object> params) {

		ArrayList<MyInquriyDTO> list = null;
		
		int page = Integer.parseInt(String.valueOf(params.get("page")));		
		String categoryCode = String.valueOf(params.get("categoryCode"));
		String inqProcess = String.valueOf(params.get("inqProcess"));
		String searchText = String.valueOf(params.get("searchText"));
		Object inqstate;
		
		if (inqProcess.equals("default")) {
			inqstate = inqProcess; // "default"를 문자열로 저장합니다.
		} else {
			inqstate = inqProcess.equals("true") ? 1 : 0; // "true"일 때는 1로, "false"일 때는 0으로 저장합니다.
		}
				
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int offset = 0;
		int total = 0;
		int range = 0;
		offset = 10*(page - 1);
		if(!searchText.equals("default")) {
			if (categoryCode.equals("default")) {
		        if (inqProcess.equals("default")) {
		        	// 필터, 처리여부 선택 이 없을 경우
		            total =dao.totalinqSearchCount(searchText);           
		    		list = dao.inquirySearchList(offset,searchText);	    		
		        }else {	        	
		        	// 처리여부만 선택 했을 경우
		            total = dao.totalinqokSearchCount(inqstate,searchText);           
		    		list = dao.inquiryOkSearchList(offset,inqstate,searchText);
		        }
		    }else {
		        if (inqProcess.equals("default")) {
		        	// 필터 선택은 했지만 처리여부를 선택 하지 않은 경우
		            total = dao.totalinqSearchCountfilter(categoryCode,searchText);         	    		
		    		list = dao.inquirySearchListFilter(offset,categoryCode,searchText);
		        } else {
		        	// 필터 선택, 처리여부를 선택 한경우
		            total = dao.totalinqSearchCountAll(inqstate, categoryCode,searchText);       	    		
		    		list = dao.inquirySearchListAll(offset,inqstate,categoryCode,searchText);
		        }
		    }
		}else {
			if (categoryCode.equals("default")) {
		        if (inqProcess.equals("default")) {
		        	// 필터, 처리여부 선택 이 없을 경우
		            total =dao.totalinqCount();         
		    		list = dao.inquiryList(offset);	    		
		        }else {	        	
		        	// 처리여부만 선택 했을 경우
		            total = dao.totalinqokCount(inqstate);   
		    		list = dao.inquiryOkList(offset,inqstate);
		        }
		    }else {
		        if (inqProcess.equals("default")) {
		        	// 필터 선택은 했지만 처리여부를 선택 하지 않은 경우
		            total = dao.totalinqCountfilter(categoryCode);           	    		
		    		list = dao.inquiryListFilter(offset,categoryCode);
		        } else {
		        	// 필터 선택, 처리여부를 선택 한경우
		            total = dao.totalinqCountAll(inqstate, categoryCode);          	    		
		    		list = dao.inquiryListAll(offset,inqstate,categoryCode);
		        }
		    }
		}
		
        range = total%10  == 0 ? total/10 : (total/10)+1;	
        page = page>range ? range:page;	 
		
		map.put("offset", offset);
		map.put("list", list);
		// 현재 페이지
		map.put("currPage", page);
		// 총 페이지 수
		map.put("pages", range);
		
		return map;
	}



}
