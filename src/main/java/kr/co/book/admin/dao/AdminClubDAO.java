package kr.co.book.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.admin.dto.AdminBookDTO;


public interface AdminClubDAO {

	int totalAdminClub();

	ArrayList<AdminBookDTO> adminClubList(int offset);

	int totalAdminClubSearch(HashMap<String, Object> data);

	ArrayList<AdminBookDTO> adminClubListSearch(HashMap<String, Object> data);

	void clubBlind(String blind, String club_idx);

}
