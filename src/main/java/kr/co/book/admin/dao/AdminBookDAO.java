package kr.co.book.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.book.admin.dto.AdminBookDTO;



public interface AdminBookDAO {

	int totalAdminBook();

	ArrayList<AdminBookDTO> adminBookList(int offset);

	int totalAdminBookSearch(HashMap<String, Object> data);

	ArrayList<AdminBookDTO> adminBookListSearch(HashMap<String, Object> data);

	void bookBlind(String blind, String library_idx);

	int resetBookInfo(String library_idx);

}
