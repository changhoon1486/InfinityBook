package kr.co.book.admin.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.admin.dto.AdminBookDTO;


public interface AdminMemberDAO {

	int totalAdminBook(String member_state, String searchType, String searchText);

	ArrayList<AdminBookDTO> adminBookList(String member_state, String searchType, String searchText, int offset);

	void grade(String member_grade, String member_idx);

	String getEmail(String memberIdx);

	void resetNickname(String memberIdx, String newNickName);

}
