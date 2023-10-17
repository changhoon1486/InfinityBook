package kr.co.book.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.admin.dao.AdminMemberDAO;
import kr.co.book.admin.dto.AdminBookDTO;

@Service
@MapperScan(value = {"kr.co.book.admin.dao"}) 
public class AdminMemberService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminMemberDAO adminMemberDAO;
	
	public HashMap<String, Object> adminMemberList(String sPage, String member_state, String searchType,	String searchText) {
		HashMap<String, Object> adminMember = new HashMap<String, Object>();	
		ArrayList<AdminBookDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 10*(page-1);
		int total = 0;
		
		total = adminMemberDAO.totalAdminBook(member_state,searchType,searchText);
		list = adminMemberDAO.adminBookList(member_state,searchType,searchText,offset);
		
		
		int range = total%10  == 0 ? total/10 : total/10+1;
		page = page>range ? range:page;
		adminMember.put("offset", offset);
		adminMember.put("list", list);
		adminMember.put("currPage", page);
		adminMember.put("pages", range);
		
		return adminMember;
	}

	public void grade(String member_grade, String member_idx) {
		adminMemberDAO.grade(member_grade,member_idx);
	}

	public HashMap<String, Object> resetNickname(ArrayList<String> resetList) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		int resetSize = resetList.size();
		for (String memberIdx : resetList) {
			String newNickName = adminMemberDAO.getEmail(memberIdx);
			adminMemberDAO.resetNickname(memberIdx,newNickName);
		}				
		map.put("success", true);
		return map;
	}

}
