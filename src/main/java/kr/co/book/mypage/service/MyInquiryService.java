package kr.co.book.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.admin.dto.AdminInquiryDTO;
import kr.co.book.mypage.dao.MyInquiryDAO;
import kr.co.book.mypage.dto.MyInquriyDTO;

@Service
@MapperScan(value={"kr.co.book.mypage.dao"})
public class MyInquiryService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyInquiryDAO dao;

	// 내 문의 리스트
	public HashMap<String, Object> myinquiryList(HashMap<String, Object> params) {
		
		ArrayList<MyInquriyDTO> list = null;
		
		int page = Integer.parseInt(String.valueOf(params.get("page")));		
		String categoryCode = String.valueOf(params.get("categoryCode"));
		String inqProcess = String.valueOf(params.get("inqProcess"));
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
		
		if (categoryCode.equals("default")) {
	        if (inqProcess.equals("default")) {
	        	// 필터 선택 이 없을 경우
	            total =dao.totalmyinqCount(params.get("member_idx").toString());
	            range = total%10  == 0 ? total/10 : (total/10)+1;	
	            page = page>range ? range:page;
	            
	    		list = dao.myinquiryList(offset,params.get("member_idx").toString());	    		
	        } else {
	        	// 처리여부를 선택 했을 경우
	            total = dao.totalmyinqokCount(params.get("member_idx").toString(), inqstate);
	            range = total%10  == 0 ? total/10 : (total/10)+1;	           
	            page = page>range ? range:page;
	            
	    		list = dao.myinquiryOkList(offset,params.get("member_idx").toString(),inqstate);
	        }
	    }else {
	        if (inqProcess.equals("default")) {
	        	// 필터 선택은 했지만 처리여부를 선택 하지 않은 경우
	            total = dao.totalmyinqCountfilter(params.get("member_idx").toString(), categoryCode);
	            range = total%10  == 0 ? total/10 : (total/10)+1;	
	            page = page>range ? range:page;
	            	    		
	    		list = dao.myinquiryListFilter(offset,params.get("member_idx").toString(),categoryCode);
	        } else {
	        	// 필터 선택, 처리여부를 선택 한경우
	            total = dao.totalmyinqCountAll(params.get("member_idx").toString(), inqstate, categoryCode);
	            range = total%10  == 0 ? total/10 : (total/10)+1;	
	            page = page>range ? range:page;	            	    		
	    		list = dao.myinquiryListAll(offset,params.get("member_idx").toString(),inqstate,categoryCode);
	        }
	    }
		map.put("offset", offset);
		map.put("list", list);
		// 현재 페이지
		map.put("currPage", page);
		// 총 페이지 수
		map.put("pages", range);
		
		return map;
	}
	
	// 문의 작성
	public void inquirywrite(HashMap<String, Object> params) {
		dao.inquirywrite(params);
	}

	// 내 문의 상세보기
	public MyInquriyDTO myinquirydetail(String inquiry_idx) {
		
		return dao.myinquirydetail(inquiry_idx);
	}

	// 내 문의 답변 리스트
	public HashMap<String, Object> myinquiryreplylist(String reply_idx) {
		HashMap<String, Object> reply = new HashMap<String, Object>();
		ArrayList<MyInquriyDTO> list = null;
		
		list = dao.myinquiryreplylist(reply_idx);
		reply.put("list", list);
		
		return reply;
	}
	// 내 문의 답변 상세보기
	public MyInquriyDTO myinquiryreplydetail(String inquiry_idx) {
		
		return dao.myinquiryreplydetail(inquiry_idx);
	}



}
